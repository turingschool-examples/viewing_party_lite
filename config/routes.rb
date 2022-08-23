Rails.application.routes.draw do
  get '/', to: 'users#index'
  get '/register', to: 'users#new'

  resources :users, only: [:show, :create] do
    resources :movies, only: [:index, :show] do
      resources :parties, only: [:new, :create]
    end
  end

  # get '/users/:id/discover', to: 'movies#???'
  # get '/users/:id/movies/:id/viewing-party/new', to: 'parties#new'
end
