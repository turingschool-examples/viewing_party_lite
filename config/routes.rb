Rails.application.routes.draw do
  get '/', to: 'landing_page#index'

  get '/users/new', to: 'users#new'
  post 'users', to: 'users#create'

  get '/users/:id/movies', to: 'movies#results'
  get 'users/:id/discover', to: 'movies#index'
  get 'users/:id', to: 'users#show'

end
