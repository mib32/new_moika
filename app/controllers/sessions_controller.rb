class SessionsController < Devise::SessionsController
	layout false
  before_filter :resource_name

  def resource_name
    # if params[:user].present?
    #   email = params[:user][:email]
    #   @user_test ||= User.where(email: email)
    #   @normal_user_test ||= NormalUser.where(email: email)
    #   if @user_test.any?
    #     res = :user
    #   elsif @normal_user_test.any?
    #     res = :normal_user
    #   else
    #     res = :user
    #   end
    # else
    #   res = :user
    # end
    # resa = :normal_user
    # logger.info res
    # logger.info resa
    # return resa
    # :normal_user
    # _normal_or_car_wash_admin
    # logger.info devise_mapping.name
    devise_mapping.name
  end

  def new
    self.resource = resource_class.new(sign_in_params)
    @d = auth_options
    # @normal_user = NormalUser.new(sign_in_params)
    clean_up_passwords(resource)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def get_user
    respond_to do |format|
      format.json { render :json => {:scope => _normal_or_car_wash_admin(params[:email])} }
    end
  end

  private

  def _normal_or_car_wash_admin email
      user_count = User.where(email: email).count
      normal_user_count = NormalUser.where(email: email).count
      if user_count > 0
        res = :user
      elsif normal_user_count > 0
        res = :normal_user
      else
        res = :user
      end

      return res
  end
  # def create
  #   if resource_name = :normal_user
  #     params[:normal_user] = params[:user]
  #     params[:user] = {:test => true}
  #   end
  #   super
  # end
end