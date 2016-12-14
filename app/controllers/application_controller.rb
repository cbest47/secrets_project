class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_login
    redirect_to '/sessions/new' if session[:user_id] == nil
  end

  def require_correct_user
    user = User.find(params[:id])
    redirect_to "/users/#{session[:user_id]}" if session[:user_id] != user.id
  end
  def current_user
    User.find(session[:user_id]) if session[:user_id] != nil
  end
end
