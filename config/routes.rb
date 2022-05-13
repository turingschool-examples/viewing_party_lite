Rails.application.routes.draw do
  get '/', to: 'landing_page#index'

  get '/register', to: 'users#new'

  post '/users', to: 'users#create'

  get '/users/:user_id/movies/:id', to: 'movies#details'
  get '/users/:id/movies', to: 'movies#results'
  get '/users/:id/discover', to: 'movies#index'
  get '/users/:id', to: 'users#show'

end
