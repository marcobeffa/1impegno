class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  

  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome_cognome])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :avatar_url, :username, :nome_cognome, :time_zone, :telefono, :name ])
    #:nome, :cognome, :telefono, :data_nascita, :paese_città_nascita, :stato_nascita, :avatar, :lat, :long,  :username, :professione
  end
end
