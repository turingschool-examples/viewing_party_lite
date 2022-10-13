Rails.application.routes.draw do
  get '/', to: 'landing#index'

  match 'register', via: :get, to: 'users#new'
  resources :users, only: [:show, :create] do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show] do
      resources :viewing_party, only: [:new]
    end 
  end
end
