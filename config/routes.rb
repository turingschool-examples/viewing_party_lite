Rails.application.routes.draw do
  get '/', to: "welcome#index"  
  get "/users/:id/discover", to: "users#discover"
  get "/users/:id/movies", to: "movies#index"
  post '/users/:id/search', to: 'movies#search'

  resources :users, only: [:show, :new, :create]
end
