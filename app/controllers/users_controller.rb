class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :update_main_action, :destroy]

  def new
  end

  def login
  end

  def new_car_wash
  end

  def new_normal
  end

  def show
    @car_washes = CarWash.limit(20)
  end

  def edit
    @user = current_user
  end

  def update_password
    @user = current_user
    @failure = false
    # abort("mega")
    if params[:user]
      @post = user_params
      @user = User.find(current_user.id)
      
      if @user.update_with_password(user_params)
        # Sign in the user by passing validation in case his password changed
        sign_in @user, :bypass => true
        # redirect_to root_path
        render "edit"
      else
        @res = @user.errors
        render "edit"
      end
    else
      @failure = true
      render "edit"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.required(:user).permit(:email ,:password, :password_confirmation, :current_password, :address)
  end

end
