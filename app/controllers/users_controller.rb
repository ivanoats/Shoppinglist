class UsersController  < ApplicationController

  before_action :login_required, except: [:index, :show]
  before_action :role_required,  except: [:index, :show]

  before_action :set_user,       only: [:edit, :update, :destroy]
  before_action :owner_required, only: [:edit, :update, :destroy]


  def index
    @users = User.all
  end

  def show

  end

  def create
    @user = User.new(user_params)
    @user.user = current_user
    if @user.save
      flash[:notice] = 'User has been created.'
      redirect_to @user
    else
      flash[:alert] = 'User has not been created.'
      render :action => 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :remember_me, :name, :has_role?)
    end

  def set_user
    @user = User.find params[:id]

    # TheRole: You should define OWNER CHECK OBJECT
    # When editable object was found
    # You should to define @owner_check_object before invoke of **owner_required** method
    @owner_check_object = @user
  end

end
