class LikesController < ApplicationController
  def create
    secret = Secret.find(params[:secret][:id])
    user = User.find(session[:user_id])
    like = Like.create(user:user, secret:secret)
    redirect_to :back
  end

  def destroy
    #like = Like.find(params[:id]).destroy
    user = User.find(session[:user_id])
    secret = Secret.find(params[:id])
    like = Like.find(:all, :conditions => {:user_id => user.id, :secret_id => secret.id }).destroy
    redirect_to :back
  end
end
