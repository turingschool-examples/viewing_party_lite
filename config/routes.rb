Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get '/users/:id', to: 'users#show'
  get '/users/:id/discover', to: 'discover#index', as: "discover_index"
  get '/users/:id/movies', to: 'movies#index', as: "movie_index"

  get '/users/:user_id/movies/:movie_id/viewing-party/new', to: 'parties#new' 

end
