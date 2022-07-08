Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  get '/register', to: 'users#new'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  resources :users, only: %i[create show] do
    get '/discover', to: 'movies#discover', as: 'movies_discover'
    get '/movies', to: 'movies#index'
    get '/movies/:id', to: 'movies#show', as: 'movies_show'

  end
end
