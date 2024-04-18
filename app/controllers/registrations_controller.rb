class RegistrationsController < Devise::RegistrationsController

  protected
  def after_update_path_for(resource)
    edit_user_registration_path(resource)
  end
  def update_resource(resource, params)
    # Aggiorna le risorse in base alle tue esigenze
    resource.update_without_password(params)
  end
  
end