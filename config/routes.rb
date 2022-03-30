Rails.application.routes.draw do
  root to:'welcome#index'
  post '/register', to:'users#new'

  resources :users, except: [:new] do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show] do
      get '/viewing-party/new', to:'parties#new'
      post '/viewing-party/new', to:'parties#create'
    end
  end
end
