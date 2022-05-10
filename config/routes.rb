Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"
  get "/users/:id/discover", to: "movies#index"
  resources :users, only: [:new, :show, :create]
end
