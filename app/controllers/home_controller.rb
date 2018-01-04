# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if UserRepository.setup_complete?
      redirect_to '/news'
    else
      redirect_to setup_password_path
    end
  end
end
