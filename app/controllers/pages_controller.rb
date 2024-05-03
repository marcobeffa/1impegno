class PagesController < ApplicationController
  

  # before_action :newdashval, only: %i[ home dash ]
  def docs
  end
  def dash
   
    @dashes = Dash.all
   
    # crea valore se vuoto
   
   
    
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





 






  
 

  
end
