Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create]
  get '/users/:id/discover', to: 'users#discover'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get "/", to: "landing#index"
end
