Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/:user_id/dashboard', to: 'users#show'
  get '/users/:id/discover', to: 'users#discover'
end
