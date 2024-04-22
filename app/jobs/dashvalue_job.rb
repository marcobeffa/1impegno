class DashvalueJob < ApplicationJob
  queue_as :default

  def perform
    @dash = Dash.last
    # crea valore se vuoto
     if @dash.nil?
      @dash = Dash.create
     end
    
    # crea valore se creato dopo 24 ore
     if @dash.created_at < 24.hours.ago
      @dash = Dash.create
     end
    
    # Controlla se ci sono valori mancanti negli attributi
    if !@dash.attributes.values.all?(&:present?)
      # Array dei nomi degli attributi escludendo "id", "updated_at" e "created_at"
      nomi_attributi_senza_esclusi = Dash.attribute_names - ["id", "updated_at", "created_at"]

      # Ciclo finché ci sono valori mancanti negli attributi
      while !@dash.attributes.values.all?(&:present?)
        # Trova il primo attributo con valore mancante
        attributo_mancante = nomi_attributi_senza_esclusi.find { |attributo| @dash.attributes[attributo].blank? }

        # Se trovi un attributo mancante, ottieni il suo valore e aggiorna il record
        if attributo_mancante
          response = HTTParty.get("https://api.coingecko.com/api/v3/simple/price?ids=dash&vs_currencies=#{attributo_mancante}")
          if response.code == 200
            data = JSON.parse(response.body)
            exchange_rate = data['dash']["#{attributo_mancante}"]
            @dash.update("#{attributo_mancante}": exchange_rate)
          else
            Rails.logger.error "Failed to fetch Dash to #{attributo_mancante} conversion rate: #{response.code} - #{response.body}"
          end
        else
          # Se non ci sono più attributi mancanti, esci dal ciclo
          break
        end
      end
    end
  end
end
