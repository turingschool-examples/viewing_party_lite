Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources only: %i[index new]

  root to: 'welcome#index'
  get '/register', to: 'welcome#register'

  get '/users/:id/discover', to: 'users#discover'
  get '/users/:id', to: 'users#dashboard' #maybe we use show pages as dashboards
  get '/users/:id/movies', to: 'users#movies'
  get '/users/:id/movies/:movie_id', to: 'movies#show'

  resources :users

end
