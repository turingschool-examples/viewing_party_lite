Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', to: 'users#new'
end
