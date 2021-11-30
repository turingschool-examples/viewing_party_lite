Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/register', to: 'users#new'
  resources :user, only: [:show, :create] do
    resources :movies, only: [:discover, :movies]
    resources :movies, only: [:show] do
      resources :party, only: [:new, :create]
    end
  end
end
