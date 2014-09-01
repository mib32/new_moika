class SessionsController < Devise::SessionsController
	layout false
  before_filter :resource_name

  def resource_name
    :user
  end

  def new
    self.resource = resource_class.new(sign_in_params)
    # @normal_user = NormalUser.new(sign_in_params)
    clean_up_passwords(resource)
    respond_to do |format|
      format.js { }
      format.html
    end
  end
end