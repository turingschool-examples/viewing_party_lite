Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'application#landing'
  get '/register', to: 'users#new', as: 'new_user'
  get '/users/movies/:id', to: 'movies#show'
  resources :users, only: %i[show create] do
    resources :discover, only: [:index]
    resources :movies, only: %i[index show] do
      resources :viewing_party, only: %i[new create]
    end
  end
end
