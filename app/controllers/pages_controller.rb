class PagesController < ApplicationController
  before_action :dashvalue, only: %i[ home ]

  def home
    if user_signed_in?
      @contents = current_user.contents
    end
  end

  def about
  end
  def changelog
  
    changelog_path = Rails.root.join('changelog.yml')
    @changelog_data = YAML.load_file(changelog_path)
 
  end  

  private

  
  def dashvalue
    if Dash.last.nil?
      values = {} # Creiamo un hash vuoto per memorizzare i valori ottenuti per ogni valuta
   
   
      [:eur, :chf, :gbp, :usd, :jpy].each do |valuta|
          response = HTTParty.get("https://api.coingecko.com/api/v3/simple/price?ids=dash&vs_currencies=#{valuta}")
        
        if response.code == 200
          data = JSON.parse(response.body)
          valore = data['dash'][valuta.to_s]
          # Verifichiamo se il valore è un Decimal o un Float prima di memorizzarlo nell'hash
          if valore.is_a?(Float) || valore.is_a?(BigDecimal)
            values[valuta] = valore
          else
            Rails.logger.error "Value obtained for #{valuta} is not a valid numeric format: #{valore}"
          end
        else
          Rails.logger.error "Failed to fetch Dash to #{valuta} conversion rate: #{response.code} - #{response.body}"
        end
      end
      
      # Creiamo un nuovo record nel modello Dash utilizzando i valori ottenuti dall'hash
      Dash.create!(values)
    end
    if Dash.last.created_at < 7.days.ago
      
      values = {} # Creiamo un hash vuoto per memorizzare i valori ottenuti per ogni valuta
   
   
      [:eur, :chf, :gbp, :usd, :jpy].each do |valuta|
          response = HTTParty.get("https://api.coingecko.com/api/v3/simple/price?ids=dash&vs_currencies=#{valuta}")
        
        if response.code == 200
          data = JSON.parse(response.body)
          valore = data['dash'][valuta.to_s]
          # Verifichiamo se il valore è un Decimal o un Float prima di memorizzarlo nell'hash
          if valore.is_a?(Float) || valore.is_a?(BigDecimal)
            values[valuta] = valore
          else
            Rails.logger.error "Value obtained for #{valuta} is not a valid numeric format: #{valore}"
          end
        else
          Rails.logger.error "Failed to fetch Dash to #{valuta} conversion rate: #{response.code} - #{response.body}"
        end
      end
      
      # Creiamo un nuovo record nel modello Dash utilizzando i valori ottenuti dall'hash
      Dash.create!(values)
    end
  end
  
  
  
    

  
end
