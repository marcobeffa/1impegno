class PagesController < ApplicationController

  def dash
    Dash.destroy_all
    flash[:success] = "Tutti i record della tabella Dash sono stati eliminati."
 
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

  



 
 
  
  

  
end
