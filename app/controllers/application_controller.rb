class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

<<<<<<< HEAD
  before_action :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
=======
  def hello
    render html: "hello, world!"
>>>>>>> chap3
  end
end
