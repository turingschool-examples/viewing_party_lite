Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "landing#index"
  resources :users do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show] do
      resources :viewing_party, only: [:new, :create]
    end
  end

  post '/users/new', to: 'users#create'
end
