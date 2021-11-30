Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :users, only: :create
  get '/dashboard', controller: :users, action: :show
  get '/registration', controller: :users, action: :new
end
