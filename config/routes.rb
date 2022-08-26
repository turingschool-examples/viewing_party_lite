Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'landing#index'

  get '/users/:id/movies/:movie_id', to: 'movies#show'
  get "/register", to: 'users#new'
  get "/users/:id", to: 'users#show'
  get '/user/:id/discover', to: 'users#show'
  post "/users", to: 'users#create'
  get '/users/:id/movies', to: 'users#movie'
  get '/users/:id/discover', to: 'users#discover'
end
