Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create]
  get '/users/:id/discover', to: 'users#discover'

  get "/", to: "landing#index"
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
end
