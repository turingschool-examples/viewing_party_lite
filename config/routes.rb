Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  get "/register", to: "users#new"
  get "/login", to: "users#login_form"
  post "/login", to: "users#login_user"

  resources :users, only: [:show, :create] do
    resources :discover, only: [:index], controller: "users/discover"
    resources :movies, only: [:index, :show], controller: "users/movies" do
      resources :parties, only: [:new, :create], controller: "users/parties"
    end
  end
end
