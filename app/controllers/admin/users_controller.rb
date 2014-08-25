class Admin::UsersController < AdminController

  before_filter :find_user, :only => [:edit, :update, :show, :destroy ,:add_car_wash]

  def index
    #@users = User.all
    @admins = User.admins
    @clients = User.clients
    @guests = User.guests
    @normal_users= NormalUser.all

    logger.debug ( "#{@clients}" )

        respond_to do |format|
          format.html
          format.json { render json: @users}
        end
  end

  def show
    abort("upda")
  end

  def edit
  end

  def add_car_wash
  end

  def update
    # abort("upda")
    if @user.update_attributes(user_params) && @user.make_client && @user.revoke_guest
      redirect_to admin_users_path, :notice => "User successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user_id = params[:id]
    @vt = @user.valid_to.presence
    #redirect_to admin_users_path, :notice => "User deleted."
    respond_to do |format|
      if @user.admin?
        if @vt 
          @user.destroy
          format.js {render 'admin/users/destroy_admin'}
        else
          format.js {render "admin/users/fail"}
        end
      else
        @user.destroy
        format.js {}
      end
    end
  end

  def new_admin
    @user = User.new
  end

  def create_admin
    @user = User.new admin_params
    @user.make_admin
    @user.phone = 'non (admin)'
    @user.contact_person = 'non (admin)'
    @user.car_wash_title = 'non (admin)'
    @user.address = 'non (admin)'
    if @user.save
      redirect_to '/admin/users#admins', notice: 'Временный администратор успешно создан'
      # render "admin/new_admin"
    else
      # redirect_to '/admin/users/new_admin' , notice: @user.errors, alert: @user.errors
      render "admin/users/new_admin"
    end
  end




  protected

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :address, :normal, :password, :salt, :encrypted_password, :car_wash_id)
  end

  def admin_params
    # params.required(:user).permit(:email ,:password, :password_confirmation, :current_password, 'valid_to(1i)', 'valid_to(2i)', 'valid_to(3i)')
    params.required(:user).permit(:email ,:password, :password_confirmation, :current_password, :valid_to)
  end

end
