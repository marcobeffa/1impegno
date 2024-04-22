class DashvalueJob < ApplicationJob
  queue_as :default
  

  def perform
    #  valute = [:eur, :chf, :gbp, :usd, :jpy, :btc, :eth, :ltc, :eos, :dot, :link]
    val = :eur
    def valdash(val)
      response = HTTParty.get("https://api.coingecko.com/api/v3/simple/price?ids=dash&vs_currencies=#{val}")
    
      if response.code == 200
        data = JSON.parse(response.body)
        exchange_rate = data['dash'][val]
    
        Dash.transaction do
          @dash = Dash.last_or_initialize
          if @dash.update("#{val}" => exchange_rate)
            flash[:success] = "Exchange rate for Dash to #{val} updated successfully."
          else
            flash[:error] = "Failed to update exchange rate for Dash to #{val}."
          end
        end
      else
        Rails.logger.error "Failed to fetch Dash to #{val} conversion rate: #{response.code} - #{response.body}"
        flash[:error] = "Failed to fetch Dash to #{val} conversion rate from Coingecko API."
      end
    
      redirect_to dash_path
    end
  end
end
