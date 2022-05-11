Rails.application.routes.draw do
  get "/register", to: 'users#new'
  get '/users/:id', to: 'users#show'
  post '/users', to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get 'users/:id', to: 'users#show'

  get 'users/:id/discover', to: 'users#discover'
end
