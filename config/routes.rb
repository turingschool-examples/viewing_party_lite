Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/register', to: 'users#new'

  resources :users, only: [:show, :new, :create] do
    get '/discover', to: 'discover#index'
  end

  resources :movies, only: [:show]
end
