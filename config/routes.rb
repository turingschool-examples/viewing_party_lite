Rails.application.routes.draw do
  root to: 'landing#index'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/users/new", to: "users#new"
  get "/users/:id", to: "users#show"
  post "/users/create", to: "users#create"
  get "/discover", to: "discover#index"

  get "/register", to: "users#new"

  get "/movies", to: "movies#index"
  get "/movies/:movie_id", to: "movies#show"
  get "/movies/:movie_id/viewing-party/new", to: "parties#new"
  post "/movies/:movie_id/viewing-party/create", to: "parties#create"

  resources :users do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show]
  end

  get "/dashboard", to: "users#show"

  post '/movies/:movie_id/viewing_party', to: 'parties#create'
  get '/movies/:movie_id/viewing_party/new', to: 'parties#new'
  post '/users/new', to: 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
