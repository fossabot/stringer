class SetupPasswordsController < ApplicationController
  before_action :setup_complete

  def show
  end

  def create
    if no_password(params) || password_mismatch?(params)
      flash.now[:error] = t('first_run.password.flash.passwords_dont_match')

      render :show
    else
      user = CreateUser.new.create(params[:password])
      session[:user_id] = user.id

      redirect_to '/feeds/import'
    end
  end

  private

  def setup_complete
    redirect_to '/news' if UserRepository.setup_complete?
  end

  def no_password(params)
    params[:password].nil? || params[:password] == ""
  end

  def password_mismatch?(params)
    params[:password] != params[:password_confirmation]
  end
end
