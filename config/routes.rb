Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'landing_page#index'

  get '/register', to: 'users#new'
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
  get '/users/:id/discover', to: 'users#discover'
  get '/users/:id/movies', to: 'user_movies#index'
end
