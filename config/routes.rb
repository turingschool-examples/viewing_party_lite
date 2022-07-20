Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'application#welcome'

  get '/register', to: 'users#new'
  get '/discover', to: 'users#discover'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/users/dashboard', to: 'users#show'
  resources :users, only: [:create, :edit, :update, :index]

  resources :movies, only: %i[index show] do
    resources :viewing_partys, only: %i[new create]
  end

  # namespace :admin do
  # => get '/dashboard', to: 'dashboard#index'
end
