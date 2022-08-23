Rails.application.routes.draw do

  resources :users, only: [:show, :new]


  get "/", to: 'users#landing'

end
