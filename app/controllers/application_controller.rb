class ApplicationController < ActionController::Base
  before_action :authenticate!

  helper_method :current_user

  private

  def current_user
    @current_user ||= UserRepository.fetch(session[:user_id])
  end

  def authenticate!
    redirect_to [:new, :session] unless current_user
  end
end
