# frozen_string_literal: true

class SignOutsController < ApplicationController
  def destroy
    flash[:success] = t('signout.destroy.flash.logged_out_successfully')

    session[:user_id] = nil

    redirect_to root_path
  end
end
