Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/register', to: 'users#new'
  post '/search', to: 'movies#search'
  # post '/users', to: 'users#create'
  resources :users, only: [:create, :show] do
    resources :discover, only: [:index]
  end
end
