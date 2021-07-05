class Admin::AdminController < ApplicationController
  before_action :logged_in_user, :admin_user, only: :home

  layout "admin/application"

  include LoginSessionHelper

  def home; end

  def logged_in_user
    return if logged_in?

    flash[:danger] = t "admin.admin_session.warning_text"
    redirect_to admin_login_url
  end

  def admin_user
    redirect_to admin_login_url unless current_user.role?
  end
end
