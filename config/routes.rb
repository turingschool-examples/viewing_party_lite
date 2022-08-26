Rails.application.routes.draw do
  root 'landing#index'

  get '/register', to: 'users#new'

  get '/users/:id/discover', to: 'movies#index', as: 'discover'
  post '/users/:id/discover', to: 'movies#search', as: 'search'
  post '/users/:id/trending', to: 'movies#trending', as: 'trending'
  post '/users/:id/movies/:id', to: 'movies#movie_data', as: 'movie_info'

  resources :users do
    resources :movies, only: [:index, :show]
  end
end
