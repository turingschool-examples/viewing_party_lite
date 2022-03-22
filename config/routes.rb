Rails.application.routes.draw do
  root 'landing_page#index'

  get '/users/:id', to: 'users#show'
  get '/register', to: 'users#new'
end
