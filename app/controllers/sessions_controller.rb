# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate

  before_action :setup_account

  def create
    user = SignInUser.sign_in(params[:password])

    if user
      session[:user_id] = user.id

      redirect_uri = session.delete(:redirect_to) || '/'

      redirect_to redirect_uri
    else
      flash.now[:error] = t('sessions.new.flash.wrong_password')

      render :new
    end
  end

  def destroy
    flash[:success] = t('sessions.destroy.flash.logged_out_successfully')

    session[:user_id] = nil

    redirect_to root_path
  end

  private

  def setup_account
    redirect_to setup_password_path if !UserRepository.setup_complete?
  end
end
