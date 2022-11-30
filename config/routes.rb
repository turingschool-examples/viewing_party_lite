Rails.application.routes.draw do
  # landing page
  root 'landings#index'

  # users
  resources :users do 
    resources :discovers, only: [:index]
  end

  # registration page
  get '/register', to: 'users#new', as: :register
end
