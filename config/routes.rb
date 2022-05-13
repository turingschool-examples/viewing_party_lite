Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'landing#dashboard'
  get 'users/:id', to: 'users#dashboard'
  get '/users/:id/discover', to: 'users#discover'
  get '/register', to: 'registration#dashboard'
  post '/users', to: 'users#create'
  get '/users/:id/movies', to: 'users#results'
  get '/users/:id/movies/:id', to: 'users#details'
  post '/users/:id/movies/:id/viewing_party/new', to: 'viewing_party#new'
end
