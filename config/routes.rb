Rails.application.routes.draw do
  get '/register', to: 'register#new'
  post '/register', to: 'register#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
