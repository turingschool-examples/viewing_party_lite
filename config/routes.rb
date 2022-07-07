Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  
  get '/registration', to: 'users#new'
  # post '/registration', to: 'users#new'

  resources :users, only: %i[show create]
 
  resources :movies, only: %i[index show]

end
