# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/register', to: 'users#new'

  get '/users/:id/discover', to: 'users#discover'

  resources :users, only: %i[create show] do
    resources :movies, only: %i[index show], controller: :user_movies, param: :movie_id
  end
  
  get '/users/:user_id/movies/:movie_id/viewing_party/new', to: 'viewing_parties#new'

end
