Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/discover', to: 'discover#index'

  resources :users, only: [:show]
  resources :movies, only: [:index, :show] do
    resources :viewing_parties, only: [:new, :create]
  end


end
