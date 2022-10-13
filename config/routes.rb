Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/', to: 'landings#index' is the same?
  root 'landings#index'

  resources :users, only: [:show, :create], path: 'dashboard' do
    # post '/discover', to: 'movies#index' #discover controller with search, that searches user from there
    resources :discover, only: :index 
    resources :movies, only: [:show, :index]
  end
  resources :users, only: :new, path: 'register'



end
