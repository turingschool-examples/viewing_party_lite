Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', to: 'users#new'

  get '/users/:id', to: 'users#show', as: 'user'
end
