Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'landing_page#index'

  get '/register', to: 'users#new'
  get '/users/:id/discover', to: 'users#discover'

  resources :users, only: [:create, :show] do 
    resources :movies, controller: :user_movies
  end
end
