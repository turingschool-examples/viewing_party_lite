
Rails.application.routes.draw do
  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
  # get '/users', to: 'users#new'
  get '/users/:id', to: 'users#show'
  get '/users/:id/movies', to: 'movies#index'
  get '/', to: 'pages#home'
  get '/users/:id/discover', to: 'users#discover'
  get '/users/:user_id/movies/:id', to: 'movies#show'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'
  post '/logout', to: 'users#logout_user'
  # get '/users/:user_id/movies/:id/viewing-party/new', to: 'parties#new'
  post '/users/:user_id/movies/:id/viewing-party/new', to: 'parties#create'

  # namespace :user do
  get '/dashboard', to: 'users#show'
  get '/dashboard/movies/:id/viewing-party/new', to: 'parties#new'
  post '/dashboard/movies/:id/viewing-party/new', to: 'parties#create'
  get '/dashboard/movies/:id', to: 'movies#show'
  get '/dashboard/discover', to: 'users#discover'
  get '/dashboard/movies', to: 'movies#index'
  # end
end
