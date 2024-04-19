class PagesController < ApplicationController
  before_action :dashvalue, only: %i[ dash ]

  def dash
    @dashes = Dash.all
  end

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

  def valdash
    val = params[:val]
    response = HTTParty.get("https://api.coingecko.com/api/v3/simple/price?ids=dash&vs_currencies=#{val}")
    if response.code == 200
      data = JSON.parse(response.body)
      exchange_rate = data['dash']["#{val}"]
      @dash = Dash.last
      if  @dash.attributes.values.all?(&:present?)
        # Se tutti i campi sono validi, creiamo un nuovo record nel modello Dash
        Dash.create!("#{val}": exchange_rate)
      else
        # Se almeno uno dei campi non è valido, aggiorniamo il record esistente nel modello Dash con i nuovi valori
        @dash.update("#{val}": exchange_rate)
      end

    else
      Rails.logger.error "Failed to fetch Dash to #{val} conversion rate: #{response.code} - #{response.body}"
    end
    redirect_to dash_path
  end

  def exportdash
    # Trova l'ultimo record nel modello Dash
    last_dash_record = Dash.last
  
    # Serializza il record in formato JSON
    dash_record_json = last_dash_record.to_json
  
    # Definisci il percorso del file JSON in cui verranno salvati i dati
    file_path = Rails.root.join("public", "last_dash_record.json")
  
    # Salva i dati serializzati nel file JSON
    File.open(file_path, "w") do |file|
      file.write(dash_record_json)
    end
  end

  def importdash
    if Rails.env.development?
      # Qui inserisci la logica per l'importazione in ambiente di sviluppo
    elsif Rails.env.production?
      # Effettua una richiesta HTTP per ottenere i dati JSON dal server
      response = HTTParty.get("https://1impegno.it/last_dash_record.json")
  
      # Controlla se la richiesta ha avuto successo
      if response.code == 200
        # Analizza il contenuto JSON in un hash
        dash_data = JSON.parse(response.body)
  
        # Modifica il formato del timestamp di 'created_at' e 'updated_at' per Rails
        created_at = DateTime.parse(dash_data['created_at'])
        updated_at = DateTime.parse(dash_data['updated_at'])
  
        # Rimuovi gli attributi 'created_at' e 'updated_at' dall'hash dei dati
        dash_data.except!('created_at', 'updated_at')
  
        # Crea un nuovo record nel modello Dash utilizzando i dati importati
        Dash.create!(dash_data.merge(created_at: created_at, updated_at: updated_at))
      else
        # Gestisci il caso in cui la richiesta HTTP non abbia avuto successo
        Rails.logger.error "Failed to fetch data from the server: #{response.code} - #{response.body}"
      end
    end
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
