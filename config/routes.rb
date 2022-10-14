Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/register', to: 'users#new'

  resources :users, only: [:show, :new, :create] do
    get '/discover', to: 'discover#index'
    resources :movies, only: [:show, :index] do
      resources :viewing_party, only: [:new, :create]
    end
  end

  resources :movies, only: [:show]
end
