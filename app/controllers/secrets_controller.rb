class SecretsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]



  def new
    @secret = Secret.new
  end

  def create

    @secret = Secret.create(secret_params)
    if @secret.errors.any?
      flash[:errors] = @secret.errors.full_messages
      redirect_to new_secret_path
    else
      redirect_to users_path
    end
  end
  def destroy
    secret = Secret.find(params[:id])
    secret.destroy if secret.user_id == session[:user_id]
    redirect_to :back
  end

  private

  def secret_params
    params.require(:secret).permit(:content, :user_id )
  end

end
