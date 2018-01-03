class HomeController < ApplicationController
  def index
    if UserRepository.setup_complete?
      redirect_to '/news'
    else
      redirect_to '/setup_password'
    end
  end
end
