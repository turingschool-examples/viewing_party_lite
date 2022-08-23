Rails.application.routes.draw do
  # root 'welcome#index'

  get '/register', to: "users#new"
  
  post '/users', to: "users#create"
  get '/users/:id', to: "users#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
