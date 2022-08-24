Rails.application.routes.draw do
  # root 'welcome#index'

  get '/register', to: "users#new"
  
  post '/users', to: "users#create"
  get '/users/:id', to: "users#show"
  get '/users/:id/discover', to: "users#discover"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'

  get '/', to: 'landing#index'
end
