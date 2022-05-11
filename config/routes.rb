Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'landing#dashboard'
  get 'users/:id', to: 'users#dashboard'
end
