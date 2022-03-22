Rails.application.routes.draw do
  root 'landing_page#index'

  get '/register', to: 'users#new'

  resources :users, only: [:show] do
    resources :discover, only: [:index]
  end
end
