class DashvalueJob < ApplicationJob
  queue_as :default

  def perform
    valute = [:eur, :chf, :gbp, :usd, :jpy, :btc, :eth, :ltc, :eos, :dot, :link]

    valute.each do |val|
      response = HTTParty.get("https://api.coingecko.com/api/v3/simple/price?ids=dash&vs_currencies=#{val}")
      if response.code == 200
        data = JSON.parse(response.body)
        exchange_rate = data['dash'][val.to_s]
        @dash = Dash.last
        if @dash.attributes.values.all?(&:present?)
          # Se tutti i campi sono validi, creiamo un nuovo record nel modello Dash
          Dash.create!(val => exchange_rate)
        else
          # Se almeno uno dei campi non è valido, aggiorniamo il record esistente nel modello Dash con i nuovi valori
          @dash.update!(val => exchange_rate)
        end
      else
        Rails.logger.error "Failed to fetch Dash to #{val} conversion rate: #{response.code} - #{response.body}"
      end

      # Aggiungi un ritardo di 3 secondi tra le iterazioni
      sleep(3)
    end
  rescue => e
    Rails.logger.error "An error occurred while updating Dash conversion rates: #{e.message}"
  end
end