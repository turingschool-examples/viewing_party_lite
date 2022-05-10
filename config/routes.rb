Rails.application.routes.draw do
  root to: 'landing#index'

  get "/users/new", to: "users#new"
  get "/users/:id", to: "users#show"
  post "/users/create", to: "users#create"
  get "/users/:id/discover", to: "discover#index"

  get "/register", to: "users#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
