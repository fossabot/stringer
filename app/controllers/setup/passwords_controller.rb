# frozen_string_literal: true

module Setup
  class PasswordsController < ApplicationController
    skip_before_action :authenticate

    before_action :setup_completed

    def show
    end

    def create
      if no_password(params) || password_mismatch?(params)
        flash[:error] = t('first_run.password.flash.passwords_dont_match')

        render :show
      else
        user = CreateUser.new.create(params[:password])
        session[:user_id] = user.id

        redirect_to feeds_import_path
      end
    end

    private

    def setup_completed
      redirect_to news_index_path if UserRepository.setup_complete?
    end

    def no_password(params)
      params[:password].nil? || params[:password] == ""
    end

    def password_mismatch?(params)
      params[:password] != params[:password_confirmation]
    end
  end
end
