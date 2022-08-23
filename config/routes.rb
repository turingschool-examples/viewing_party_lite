Rails.application.routes.draw do
  root 'landing#index'

  get '/', to: 'landing#index'
  # get '/register', to: 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
