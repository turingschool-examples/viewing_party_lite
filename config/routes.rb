Rails.application.routes.draw do
  get '/', to: 'landing#index'

  get '/users/:id', to: 'users#show'
end
