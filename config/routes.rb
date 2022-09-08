Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'landing#index'

  get '/register', to: 'users#new'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'

  resources :users, only: [:show, :new, :create] 
  get '/users/:id/discover', to: 'discover#show'
  
  get '/users/:id/movies', to: 'user_movies#index'
  get '/users/:user_id/movies/:movie_id', to: "users#movie_show"

  get '/users/:user_id/movies/:movie_id/viewing-party/new', to: 'viewingparties#new'
  post '/users/:user_id/movies/:movie_id/viewing-party/new', to: 'viewingparties#create'
end
