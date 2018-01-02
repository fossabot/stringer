Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  root to: 'home#index'
end
