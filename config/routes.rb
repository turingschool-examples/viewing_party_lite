Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'landing#index'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get '/users/:id', to: 'users#show'
  get '/users/:id/discover', to: 'users#discover'
  get '/users/:id/movies', to: 'movies#index'
  get '/users/:id/movies/:id', to: 'movies#show'

end
