Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'landing#index'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  resources :users, only: %i[show new create] do
    get 'discover', on: :member
    get 'movies'
  end
end
