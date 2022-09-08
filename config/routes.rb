Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'welcome#index'

  # get '/login', to: 'users#login_form'
  # post '/login', to: 'users#login_user'
  
  # get '/', to: 'landing_page#index'

  # get '/users', to: 'users#new'

  # get '/register', to: 'users#new'
  # get '/users/:id/discover', to: 'users#discover'

  # get '/users/:user_id/movies/:movie_id', to: 'user_movies#show'
  # get '/users/:user_id/movies/:movie_id/viewing-party/new', to: 'parties#new'

  # resources :users, only: [ :index, :show, :new, :create ] do
  #   resources :users, only: [:create, :show] do 
  #   post '/movies', to: 'user_movies#index'
  #   get '/movies', to: 'user_movies#index'
  root 'welcome#index'

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'
  get '/special', to: 'special#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/users/:id/discover', to: 'users#discover'
  get 'users/:id/movies', to: 'users#discover'
  post 'users/:id/movies', to: 'users#discover'

  resources :users, only: [ :index, :show, :new, :create ] do
    resources :movies, only: [ :index, :show ] do
      resources :viewing_parties, only: [ :new, :create ]
    end
  end
end
