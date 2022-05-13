Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "landing_page#main"

  get "/register", to: "users#new"
  post "/register", to: "users#create"

  get "/users/:id", to: "users#show"
  get "/users/:id/discover", to: "users#discover"
  get "/users/:id/users/:id/movies", to: "users#movies"
  get "/users/:id/movies", to: "users#movies"

  get "/users/:user_id/movies/:movie_id", to: "movies#show"
  get "/users/:user_id/movies/:movie_id/viewing-party/new", to: "movies#new"
  post "/users/:user_id/movies/:movie_id/viewing-party", to: "movies#create"
end
