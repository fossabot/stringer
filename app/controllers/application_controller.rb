# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include HttpAcceptLanguage::AutoLocale

  skip_before_action :verify_authenticity_token # TODO: enable later

  before_action :authenticate

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate
    redirect_to new_session_path if !current_user
  end
end
