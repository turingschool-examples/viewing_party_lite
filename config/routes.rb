Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'application#landing'
  get '/register', to: 'users#new'
  
  resources :users, only: [:show, :create] do 
    resources :movies, only: [:index], :path => "/discover"
  end
end
