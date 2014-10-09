class RegistrationsController < Devise::RegistrationsController
   before_filter :configure_permitted_parameters

   def create
    car_wash_owner_checkbox = params[:user].delete(:car_wash_owner_checkbox)
    if car_wash_owner_checkbox
      params[:user][:type] = 'car_wash_owner'
    else
      params[:user][:type] = 'user'
    end

    build_resource(sign_up_params)

    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        SystemMailer.new_registration_happen(resource).deliver
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      @validatable = devise_mapping.validatable?
      if @validatable
        @minimum_password_length = resource_class.password_length.min
      end
      respond_with resource
    end
  end

  def update
    # byebug
    @user = User.find(current_user.id)
    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
    else
      # remove the virtual current_password attribute
      # update_without_password doesn't know how to ignore it
      params[:user].delete(:current_password)
      @user.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end
# config/routes.rb
# devise_for :users, :controllers => { :registrations => "users/registrations" }

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :address, :phone, :car_wash_title, :contact_person,
               :email, :password, :password_confirmation, :car_wash_owner_checkbox, :type)
    end

    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:car_wash_title, :address, :username, :email, :password, :password_confirmation, :type, :phone)
    end

  end

  def after_sign_up_path_for(resource)
    if resource.is_a?(User)
      user_path(resource)
    end
  end

  def needs_password?(user, params)
    # user.email != params[:user][:email] ||
    #   params[:user][:password].present? ||
    #   params[:user][:password_confirmation].present?
    false
  end
end
