Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/', to: 'application#home'
  root 'application#home'
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  resources :users, only: [:show] do
    get '/discover', to: 'users#discover'
  end
end
