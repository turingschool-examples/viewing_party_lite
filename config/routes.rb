Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/users/new', to: 'users#new'
  post '/users/new', to: 'users#create'
  get '/users/:id', to: 'users#show'

  get 'users/:user_id/movies/discover', to: 'users#discover'

  get '/users/:id/movies', to: 'movies#results'

  # get "/users/:user_id/movies/search", to: 'movies#search'

  get '/users/:user_id/movies/:movie_id', to: 'movies#show'

  # post '/users/:id/movies', to: 'movies#discover'

end
