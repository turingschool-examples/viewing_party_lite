Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'landing_page#index'

  get '/register', to: 'users#new'

  post '/users', to: 'users#create'

  get '/users/new', to: 'users#new'

  get '/users/:id', to: 'users#show'
end
