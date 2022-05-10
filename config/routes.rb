Rails.application.routes.draw do
  root to: 'landing#index'

  get "/users/:id", to: "users#show"
  get "/users/new", to: "users#new"
  post "/users/create", to: "users#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
