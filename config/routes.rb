Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get '/dashboard', to: 'users#show'
  get '/dashboard/discover', to: 'discover#index', as: 'discover_index'
  get '/dashboard/movies', to: 'movies#index', as: 'movie_index'
  get '/dashboard/movies/:id', to: 'movies#show', as: 'movie_show'

  get '/dashboard/movies/:movie_id/viewing-party/new', to: 'parties#new'
  post '/dashboard/movies/:movie_id/viewing-party', to: 'parties#create'

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'

  get '/logout', to: 'users#logout'
end
