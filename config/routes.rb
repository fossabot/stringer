Rails.application.routes.draw do
  resource :setup_password, only: [:show, :create]

  resource :session, only: [:new, :create, :destroy]

  root to: 'home#index'
end
