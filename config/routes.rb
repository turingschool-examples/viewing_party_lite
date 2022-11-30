Rails.application.routes.draw do

  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
  get '/', to: 'pages#home'
  get '/users/:id/discover', to: 'users#discover'
end
