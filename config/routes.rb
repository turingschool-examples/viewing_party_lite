Rails.application.routes.draw do
  get '/', to: 'landing#index'

  get '/users/new', to: 'users#new'
  get '/users/:id', to: 'users#show'
  post '/users', to:  'users#create'
end
