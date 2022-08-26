Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'landing_page#index'

  get '/register', to: 'users#new'
  get '/users/:id/discover', to: 'users#discover'

  get '/users/:user_id/movies/:movie_id', to: 'user_movies#show'
  get '/users/:user_id/movies/:movie_id/viewing-party/new', to: 'parties#new'

  resources :users, only: [:create, :show] do 
    post '/movies', to: 'user_movies#index'
    get '/movies', to: 'user_movies#index'
  end
end
