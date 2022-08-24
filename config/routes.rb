Rails.application.routes.draw do
  get '/', to: "welcome#index"
  
  get "/users/:id/discover", to: "users#discover"
  resources :users, only: [:show]
  get "/users/:id/movies", to: "movies#index"
  post '/users/:id/search', to: 'movies#search'
end
