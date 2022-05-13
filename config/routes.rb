Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'landing#dashboard'
  get 'users/:id', to: 'users#dashboard'
  get '/users/:id/discover', to: 'users#discover'
  get '/register', to: 'registration#dashboard'
  post '/users', to: 'users#create'
  get '/users/:id/movies', to: 'users#results'
  get '/users/:user_id/movies/:id', to: 'users#details'
  get 'users/:host_id/movies/:id/viewing-party/new', to: 'parties#new'
  post 'users/:host_id/movies/:id/viewing-party/new', to: 'parties#create'
end
