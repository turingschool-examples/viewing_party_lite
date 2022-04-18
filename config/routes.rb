Rails.application.routes.draw do

  get '/users/:id/discover', to: 'users#discover'
  post '/users/:id/discover', to: 'users#discover'

  resources :users do
      resources :movies, only: [:index, :create], controller: :users_movies do
      end
    end
end
