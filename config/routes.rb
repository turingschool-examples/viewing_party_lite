Rails.application.routes.draw do
  get "/", to: "welcome#index"
  get "/register", to: "users#new"
  get "/login", to: "users#login_form"
  post "/login", to: "users#login_user"

  resources :users, only: [:show, :new, :create] do
    resources :discover, only: [:index], controller: "movies"
    resources :movies, only: [:show] do
      resources :parties, only: [:new, :create]
    end
  end
end
