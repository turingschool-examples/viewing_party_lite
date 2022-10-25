Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#landing'
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  post '/users', to: 'users#create'
  get '/dashboard', to: 'users#show'

  post '/dashboard/movies_top_rated', to: 'users/movies#top_rated'
  post '/dashboard/movies_search', to: 'users/movies#search'
  get '/dashboard/discover', to: 'users/discover#index'
  get '/dashboard/movies', to: 'users/movies#index'
  get '/dashboard/movies/:id', to: 'users/movies#show'

  get 'dashboard/viewing_parties', to: 'users/viewing_parties#index'
  get '/dashboard/viewing_parties/new', to: 'users/viewing_parties#new'
  post '/dashboard/viewing_parties', to: 'users/viewing_parties#create'
  get '/dashboard/viewing_parties/:id', to: 'users/viewing_parties#show'

  # resources :users, only: %i[show create] do
  #     resources :viewing_parties, only: %i[new create index show]
  #   end
  end
