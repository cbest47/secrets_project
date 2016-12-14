class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def index
    @secret = Secret.all
    @user = current_user
  end
  def show
    @secret = User.find(session[:user_id]).secrets
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.errors.any?
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    else
      session[:user_id] = @user.id
      redirect_to users_path
    end
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
