Rails.application.routes.draw do
  root 'welcome#landing'
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
    resources :users, only: [:show], to: 'dashboard#show'
  end

  post '/users', to: 'users#create'
  get '/dashboard', to: 'users#show'

  post '/movies_top_rated', to: 'movies#top_rated'
  post '/movies_search', to: 'movies#search'
  get '/discover', to: 'discover#index'

  resources :movies, only: [:index, :show] do
    resources :viewing_parties, only: [:new, :create, :show]
  end
end
