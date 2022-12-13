Rails.application.routes.draw do
  # landing page
  root 'landings#index'

  # users
  resources :users do
    resources :movies do
      resources :viewing_parties, only: [:new, :create]
    end
  end

  # admin
  namespace :admin do
    resources :dashboard, only: [:index]
  end

  # registration page
  get '/register', to: 'users#new', as: :register
  get '/login', to: 'users#login_form', as: :login
  post '/login', to: 'users#login_user', as: :login_post
  get '/users/:id/discover', to: 'users#index', as: :discover
end
