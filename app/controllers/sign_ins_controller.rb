# frozen_string_literal: true

class SignInsController < ApplicationController
  skip_before_action :authenticate

  def new
  end

  def create
    form = UserSignIn.new(resource_params)

    if form.save
      session[:user_id] = form.model.id

      # TODO: add redirect_to support
      # redirect_uri = session.delete(:redirect_to) || '/'
      # redirect_to redirect_uri

      redirect_to news_index_path
    else
      flash[:error] = form.errors.full_messages.join(', ')

      render :new
    end
  end

  private

  def resource_params
    params.require(:sign_in).permit(:email, :password)
  end
end
