Rails.application.routes.draw do
  namespace :setup do
    resource :password, only: [:show, :create]
  end

  resource :session, only: [:new, :create, :destroy]

  root to: 'home#index'
end
