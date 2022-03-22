Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/register', to: 'users#new'
  resources :users do
    resources :movies, only: [:show]
  end
end
