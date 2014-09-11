class SessionsController < Devise::SessionsController
	layout false
  before_filter :resource_name

  # def resource_name
  #   devise_mapping.name
  # end

  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    # respond_with(resource, serialize_options(resource))
    respond_to do |format|
      format.js
      format.html
    end
  end

  # def get_user
    # respond_to do |format|
      # format.json { render :json => {:scope => _normal_or_car_wash_admin(params[:email])} }
    # end
  # end
 
  # def create
  #   self.resource = warden.authenticate!(auth_options)
  #   set_flash_message(:notice, :signed_in) if is_flashing_format?
  #   byebug
  #   sign_in(resource, resource)
  #   yield resource if block_given?
  #   respond_with resource, location: after_sign_in_path_for(resource)
  # end
end