Rails.application.routes.draw do
  # landing page
  root 'landings#index'

  # users
  resources :users do
    resources :discovers
  end

  # registration page
  get '/register', to: 'users#new', as: :register
end
