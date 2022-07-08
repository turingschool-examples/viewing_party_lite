Rails.application.routes.draw do
  get '/', to: 'landing#index'
  get '/users/register', to: 'users#new'
  get '/users/:id/discover', to: 'discover#index'
  get '/users/:id', to: 'users#show'
  post '/users/register', to: 'users#create'

  get '/users/:id/movies', to: 'movies#index'

end
