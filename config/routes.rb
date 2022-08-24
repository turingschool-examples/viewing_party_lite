Rails.application.routes.draw do
  get '/', to: "welcome#index"
  

  resources :users, only: [:show]

end
