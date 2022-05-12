Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get '/users/:id', to: 'users#show'
<<<<<<< HEAD
  get '/users/:id/discover', to: 'discover#index'
=======
  get '/users/:id/discover', to: 'discover#index', as: "discover_index"
  get '/users/:id/movies', to: 'movies#index', as: "movie_index"
>>>>>>> 4d47e004537b94027f2011c16ef7c09f31f0c3fe
end
