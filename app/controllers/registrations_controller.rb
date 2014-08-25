class RegistrationsController < Devise::RegistrationsController
   before_filter :configure_permitted_parameters


# config/routes.rb
# devise_for :users, :controllers => { :registrations => "users/registrations" }

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :address, :phone, :car_wash_title, :contact_person,
               :email, :password, :password_confirmation)
    end

  end

    def after_sign_up_path_for(resource)
      if resource.is_a?(User)
        user_path(resource)
      end
    end
end
