Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  get "/register", to: "users#new"
  resources :users, only: [:show, :create] do
    resources :discover, only: [:index], controller: "users/discover"
    resources :movies, only: [:index, :show], controller: "users/movies"
  end

end
