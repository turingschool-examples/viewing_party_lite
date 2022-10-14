Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'

  resources :users, only: %i[create show] do
    get '/discover', to: 'users#discover'

    resources :movies, only: %i[index show] do
      resources :parties, only: %i[new create]
    end
  end

  get '/register', to: 'users#new'
end
