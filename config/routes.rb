Rails.application.routes.draw do
  get '/', to: "welcome#index"  
  get "/users/:id/discover", to: "users#discover"
  post '/users/:id/search', to: 'movies#index'

  resources :users, only: [:show, :new, :create] do
    resources :movies, only: [:show, :index]
  end
end
