Rails.application.routes.draw do
  root to: "welcome#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  get "/register", to: "users#new"
  get "/dashboard", to: "users#show"
  post "/users", to: "users#create"

  get "/discover", to: "movies#index"
  get "/movies", to: "movies#results"
  get "/movies/:id", to: "movies#show"

  get "/movies/:movie_id/viewing_party/new", to: "parties#new"
  post "/movies/:movie_id/viewing_party", to: "parties#create"

end
