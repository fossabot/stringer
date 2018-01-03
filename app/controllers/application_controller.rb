class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token # TODO: enable later

  before_action :set_locale

  before_action :authenticate_or_not

  helper_method :current_user

  private

  def set_locale
    I18n.locale = ENV["LOCALE"].blank? ? :en : ENV["LOCALE"].to_sym
  end

  def authenticate_or_not
    if !authenticated? && needs_authentication?(request)
      session[:redirect_to] = request.fullpath
      redirect_to new_session_path
    end
  end

  def authenticated?
    session[:user_id]
  end

  def needs_authentication?(request)
    return false unless UserRepository.setup_complete?
    return false if request.path == '/session/new' && request.method == 'GET'
    # return false if %w(/login /logout /heroku).include?(path)
    true
  end

  def current_user
    @current_user ||= UserRepository.fetch(session[:user_id])
  end
end
