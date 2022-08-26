Rails.application.routes.draw do

  root to: 'welcome#index'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get '/users/:id', to: 'users#show'
  get '/users/:id/discover', to: 'users#discover'

  get 'users/:user_id/movies/:movie_id', to: 'movies#show'
  get '/users/:id/movies', to: 'movies#index'

  get '/users/:user_id/movies/:movie_id/viewing-party/new', to: 'viewing_party#new'
  post '/users/:user_id/movies/:movie_id/viewing-party/new', to: 'viewing_party#create'
end
