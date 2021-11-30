Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'main#index'


  get '/register', to: 'user#new'
  post '/register', to: 'user#create'

  resources :user, only: :show
end
