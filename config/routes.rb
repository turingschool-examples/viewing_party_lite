Rails.application.routes.draw do
  get "/", to: "landing#index"
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get '/users/:id/discover', to: 'users#discover'
  get "/users/:user_id/movies/:id/viewing-party/new", to: 'viewing_party#new' 
  resources :users, only: [:show, :new, :create] do
    resources :movies, only: [:index, :show]
  end
end
