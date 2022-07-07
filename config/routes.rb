Rails.application.routes.draw do
  get '/', to: 'landing#index'
  get '/users/register', to: 'users#new'
  get '/users/:id/discover', to: 'users#search'
  get '/users/:id', to: 'users#show'
  post '/users/register', to: 'users#create'

end
