Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'landing#index'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get '/users/:id', to: 'users#show'
  get '/users/:id/discover', to: 'users#discover'
  get '/users/:id/movies', to: 'movies#index'
  get '/users/:id/movies/:movie_id', to: 'movies#show'

  get '/users/:id/movies/:movie_id/viewing-party/new', to: 'viewing_parties#new'
  post '/users/:id/movies/:movie_id/viewing-party/new', to: 'viewing_parties#create'
end
