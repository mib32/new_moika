class MobileController < ApplicationController
  layout 'mobile'
  # skip_before_filter :authenticate, :only => :admin
  before_action :authenticate
  # before_action :authenticate_user!
  before_action :set_car_wash, only: [:admin, :requests, :subscribes]

  # after_action :mark_as_read

  def admin

  end

  def requests

  end 

  def subscribes
  end

  private

  def mark_as_read
    case action_name
    when 'requests'
      @car_wash.requests.update_all(read: true)
    when 'subscribes'
      @car_wash.subscribes.update_all(read: true)
    end
    
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      resource = User.find_by_email(username)
      if resource and resource.valid_password?(password)
        sign_in :user, resource
      else
        render inline: "<h1>Неправильный логин или пароль.</h1>"
      end
    end
  end

  def set_car_wash
    @car_wash = current_user.car_wash
  end
end
