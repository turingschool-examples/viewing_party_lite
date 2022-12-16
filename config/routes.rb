Rails.application.routes.draw do
  root to: 'landing_page#index'

  resources :users, only: [:show, :new] do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show] do
      resources :viewing_parties, only: [:new, :create]
    end
  end

  get '/register', to: 'users#new'
  post '/users/new', to: 'users#create' 

end
