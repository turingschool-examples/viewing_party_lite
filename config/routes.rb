Rails.application.routes.draw do
  root to: 'landing_page#index'

  resources :users, only: [:show, :new] do
    resources :movies, only: [:index]
    resources :discover, only: [:index]
  end

  get '/register', to: 'users#new'
  post '/users/new', to: 'users#create' 

end
