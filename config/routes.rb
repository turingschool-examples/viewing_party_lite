Rails.application.routes.draw do
  # landing page
  root 'landings#index'

  # users
  resources :users do
    resources :movies do
      resources :viewing_parties, only: [:new, :create]
    end
  end

  # registration page
  get '/register', to: 'users#new', as: :register
  get '/users/:id/discover', to: 'users#index', as: :discover
end
