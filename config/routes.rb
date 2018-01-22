# frozen_string_literal: true

Rails.application.routes.draw do
  resource :sign_up, only: [:new, :create]

  resource :sign_in, only: [:new, :create]

  namespace :setup do
    resource :password, only: [:show, :create]

    resource :tutorial, only: :show
  end

  resources :feeds, only: [:index, :new, :create, :edit, :update, :destroy]

  resources :news, only: :index

  resources :stories, only: :update

  namespace :stories do
    resource :mark_all_as_read, only: :create
  end

  resources :starred, only: :index, controller: 'starred_news'

  resources :archive, only: :index, controller: 'archived_news'

  namespace :feeds do
    resource :import, only: [:show, :create]

    resource :export, only: :show
  end

  resources :feed, only: :show

  resource :session, only: [:new, :create, :destroy]

  resource :heroku, only: :show

  resource :debug, only: :show

  root to: 'news#index'
end
