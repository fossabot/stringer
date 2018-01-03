Rails.application.routes.draw do
  namespace :setup do
    resource :password, only: [:show, :create]

    resource :tutorial, only: :show
  end

  resources :feeds, only: [:index, :new, :create, :edit, :update, :destroy]

  resources :news, only: :index

  resources :stories, only: :update

  resources :starred, only: :index, controller: 'starred_news'

  resources :archive, only: :index, controller: 'archived_news'

  namespace :feeds do
    resource :import, only: [:show, :create]

    resource :export, only: :show
  end

  resource :session, only: [:new, :create, :destroy]

  resource :heroku, only: :show

  resource :debug, only: :show

  root to: 'home#index'
end
