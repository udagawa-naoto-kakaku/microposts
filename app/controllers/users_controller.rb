class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :followings, :followed]
  before_action :logged_in?, only: [:edit, :update]
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'プロフィールを編集しました'
    else
      render 'edit'
    end
  end
  
  def followings
    @users = @user.following_users
  end
  
  def followed
    @users = @user.follower_users
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmaiton, :favorite)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
