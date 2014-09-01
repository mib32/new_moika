class ApplicationController < ActionController::Base
  after_action :allow_iframe
  helper :application
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_devise_params, if: :devise_controller?
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :temp_require_login 
  before_action :set_navs

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| 
      u.permit(:password, :password_confirmation, :current_password) 
    }
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      if resource.client?
        edit_car_wash_path(resource.car_wash)
      elsif resource.admin?
        admin_path
      else
        super
      end
    else
      super
    end
  end

  def set_navs
    @navs = Nav.all
  end

  protected
    def check_access
      redirect_to(root_path) and return unless current_user and (current_user.client? or current_user.admin?)
    end

    def configure_devise_params
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:phone, :contact_person, :car_wash_title, :email, :password, :password_confirmation)
      end
    end

    def temp_require_login
      unless session['athd']
        redirect_to temp_session_index_path
      end
    end


  private
    def allow_iframe
      response.headers.except! 'X-Frame-Options'
    end
end
