Rails.application.routes.draw do
  # landing page
  root 'landings#index'

  # users
  resources :users do
    resources :movies
  end

  # registration page
  get '/register', to: 'users#new', as: :register
  get '/users/:id/discover', to: 'users#index', as: :discover
end
