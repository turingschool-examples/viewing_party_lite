Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/register', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create', as: 'create_user'

  get 'users/:id', to: 'users#show', as: 'user'

end
