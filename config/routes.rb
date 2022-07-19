Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  get '/register', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  get 'logout', to: 'sessions#destroy'

  resources :users, only: %i[create]
  resources :movies, only: %i[index show] do
    resources :viewing_parties, only: %i[new create]
  end
  get '/dashboard', to: 'users#show'
  get '/discover', to: 'movies#discover'
end
