class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    access_token = request.env["omniauth.auth"]
    @user = User.find_for_facebook_oauth access_token
    if @user
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      @user = User.new(:social_id => access_token.uid,
                  :provider => access_token.provider,
                   :url => access_token.info.urls.Facebook,
                   :name => access_token.extra.raw_info.name,
                   :nickname => access_token.extra.raw_info.username, 
                   :email => access_token.extra.raw_info.email, 
                   :type => 'user',
                   :password => Devise.friendly_token[0,20]) 
      if @user.save
        @sign_up_successful = true
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
        sign_in @user, :event => :authentication
        @sign_up_successful = true
      else
        flash[:notice] = 'Зарегистрироваться не удалось:'
        render 'devise/sessions/new'
      end
    end
  end


  def vkontakte
    access_token = request.env["omniauth.auth"]
    @user = User.find_for_vk_oauth access_token
    if @user
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Вконтакте"
      sign_in_and_redirect @user, :event => :authentication
    else
      @user = User.new(:social_id => access_token.uid,
                  :provider => access_token.provider,
                   :url => access_token.info.urls.Vkontakte,
                   :name => [access_token.extra.raw_info.first_name,access_token.extra.raw_info.first_name].join(' '),
                   :nickname => access_token.extra.raw_info.username, 
                   :email => access_token.extra.raw_info.screen_name+'@vk.com', 
                   :type => 'user',
                   :password => Devise.friendly_token[0,20]) 
      if @user.save
        @sign_up_successful = true
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Вконтакте"
        sign_in @user, :event => :authentication
        @sign_up_successful = true
      else
        flash[:notice] = 'Зарегистрироваться не удалось:'
        render 'devise/sessions/new'
      end
    end
  end

  private
  def _authenticate_user user
  end
end
