Rails.application.routes.draw do
  get "/", to: "welcome#index"
  get "/register", to: "users#new"

  resources :users, only: [:show, :new, :create] do
    resources :discover, only: [:index], controller: "movies"
  end
end
