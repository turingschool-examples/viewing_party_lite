Rails.application.routes.draw do
  get "/", to: "welcome#index"

  # resources :user, only: [:show]
  get "/register", to: "users#new"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show"
end
