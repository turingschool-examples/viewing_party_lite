Rails.application.routes.draw do
  # landing page
  root 'landings#index'

  # users
  resources :users

  # registration page
  get '/register', to: 'users#new', as: :register
end
