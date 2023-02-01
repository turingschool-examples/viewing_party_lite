Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'welcome#index'

  get '/register', to: 'users#new'

  resources :users, except: [:new] do 
    member do
      get 'discover', to: 'users/discover#index'
    end
    resources :movies, only: [:index, :show], controller: 'users/movies'
  end
end
