Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/register', to: 'users#new'
  # post '/users', to: 'users#create'
  resources :users, only: [:create, :show]
end
