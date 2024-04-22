class PagesController < ApplicationController
  before_action :newdashval, only: %i[ home dash ]
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
      if @dash.nil?
       @dash = Dash.create
      end
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

  private

  def newdashval
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
    
      # Ciclo finché ci sono valori mancanti negli attributi
      if !@dash.attributes.values.all?(&:present?)
        nomi_attributi_senza_esclusi = Dash.attribute_names - ["id", "updated_at", "created_at"]

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
       
        end
      end
  

  end

  
 

  
end
