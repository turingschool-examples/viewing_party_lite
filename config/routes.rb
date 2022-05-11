Rails.application.routes.draw do
  get '/', to: 'landing_page#index'

  post '/users/new', to: 'users#new'
  post 'users', to: 'users#create'

  get 'users/:id', to: 'users#show'
end
