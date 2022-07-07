Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/registration', to: 'users#new'

  resources :users, only: %i[show create]

end
