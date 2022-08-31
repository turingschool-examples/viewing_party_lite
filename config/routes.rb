Rails.application.routes.draw do
<<<<<<< HEAD
  root 'landing#index'

  get '/register', to: 'users#new'

  get '/users/:id/discover', to: 'movies#index', as: 'discover'
  post '/users/:id/discover', to: 'movies#search', as: 'search'
  post '/users/:id/trending', to: 'movies#trending', as: 'trending'
  post '/users/:id/movies/:id', to: 'movies#movie_data', as: 'movie_info'

  resources :users do
    resources :movies, only: [:index, :show]
  end
=======
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
>>>>>>> fd04e93827d61bff06c7826b49064ca9102eb36a
end
