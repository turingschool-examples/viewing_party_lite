Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'landing#index'
  
  get "/register", to: 'users#new'
  get "users/:id", to: 'users#show'
  post "/users", to: 'users#create'
  get '/users/:id/movies?q=top%20rated', to: 'users#movie'
end
