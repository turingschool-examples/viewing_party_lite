Rails.application.routes.draw do
  resources :parties
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'
  get '/register', to: 'users#new'
  

  # get '/users', to: 'users#show'
  resources :users, only: [:show, :create] do
    resources :discover, only: [:index]
    resources :movies, only: [:index]
  end
end
