Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources only: %i[index new]

  root to: 'welcome#index'

  get '/register', to: 'welcome#register'



end
