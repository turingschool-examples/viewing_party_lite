Rails.application.routes.draw do
  get "/", to: "landing#index"
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get '/users/:id/discover', to: 'users#discover'
  
  resources :users, only: [:show, :new, :create] do
    resources :movies, only: [:index]
  end
end
