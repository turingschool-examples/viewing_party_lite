Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

  get '/users/:id/discover', to: "users#discover"
  resources :users, only: [:index, :show, :create] do
    resources :movies, controller: "user_movies", only: [:index]
  end

  get '/register', to: "users#new"
end
