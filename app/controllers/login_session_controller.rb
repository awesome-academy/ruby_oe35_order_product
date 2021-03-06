class LoginSessionController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:user][:email].downcase
    if user&.authenticate params[:user][:password]
      log_in user
      redirect_to user
    else
      flash.now[:danger] = t "global.fail"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
