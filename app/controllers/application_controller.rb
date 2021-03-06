class ApplicationController < ActionController::Base
  before_action :set_locale

  include LoginSessionHelper

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t "global.fail"
    redirect_to root_url
  end

  private

  def set_locale
    locale = params[:locale].to_s.strip.to_sym || I18n.default.locale
    lang = I18n.available_locales.include?(locale)
    I18n.locale = lang ? locale : I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
