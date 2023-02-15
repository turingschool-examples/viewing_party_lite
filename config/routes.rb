Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/register', to: 'users#new', as: :new_user

  get '/dashboard', to: 'users#show', as: :user

  get '/login', to: 'sessions#new', as: :users_login

  delete '/logout', to: 'sessions#delete', as: :logout

  post '/login', to: 'sessions#create'

  resources :users, only: [:index, :create]

  resources :discover, only: :index
  resources :movies, only: %i[index show] do
    resources :viewing_parties, only: %i[new create]
  end
end
