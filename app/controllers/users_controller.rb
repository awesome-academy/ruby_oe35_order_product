class UsersController < ApplicationController
  before_action :load_user, except: %i(create new)

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "global.success"
      redirect_to @user
    else
      flash[:danger] = t "global.fail"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit User::USER_ATTRS
  end
end
