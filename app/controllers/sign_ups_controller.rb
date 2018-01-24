# frozen_string_literal: true

class SignUpsController < ApplicationController
  skip_before_action :authenticate

  def new
  end

  def create
    form = UserSignUp.new(resource_params)

    if form.save
      session[:user_id] = form.model.id

      redirect_to news_index_path
    else
      flash[:error] = form.errors.full_messages.join(', ')

      render :new
    end
  end

  private

  def resource_params
    params.require(:sign_up).permit(:email, :password, :password_confirmation)
  end
end
