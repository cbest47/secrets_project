class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    #reset_session
    redirect_to '/sessions/new'
  end
  def create
    user = User.find_by(email: login_params[:email])
    if user && user.authenticate(login_params[:password])
      session[:user_id] = user.id
      redirect_to users_path
    else
      flash[:errors] = "sorry, that's not right!"
      redirect_to new_session_path
    end
  end

  private

  def login_params
    params.require(:login).permit(:email, :password)
  end

end
