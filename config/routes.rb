Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/register', to: "users#new"
  post '/users', to: "users#create"
  get '/users/:id', to: 'users#show'
  get '/users/:id/discover', to: 'movies#discover'
  get "/users/:id/movies", to: 'movies#index'

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'
end
