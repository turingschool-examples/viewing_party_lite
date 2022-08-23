Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  resources :users, only: [:show, :new, :create] do
    resources :movies, only: [:index]
  end

  get '/users/:id/discover', to: 'users#discover'
end
