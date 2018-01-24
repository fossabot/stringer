# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate

  before_action :setup_account

  def create
    form = UserSignIn.new(resource_params)

    if form.save
      session[:user_id] = form.model.id

      redirect_uri = session.delete(:redirect_to) || '/'

      redirect_to redirect_uri
    else
      flash[:error] = form.errors.messages.values.join(', ')

      render :new
    end
  end

  private

  def setup_account
    redirect_to setup_password_path if !UserRepository.setup_complete?
  end

  def resource_params
    params.require(:session).permit(:email, :password)
  end
end
