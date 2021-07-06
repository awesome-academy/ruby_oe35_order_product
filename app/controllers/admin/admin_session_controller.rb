class Admin::AdminSessionController < Admin::AdminController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate(params[:session][:password])&.role
      log_in user
      redirect_to admin_root_path
    else
      flash.now[:danger] = t "global.fail"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to admin_login_url
  end
end
