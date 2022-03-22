Rails.application.routes.draw do
  get '/', to: 'landings#index'
  post '/register', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
end
