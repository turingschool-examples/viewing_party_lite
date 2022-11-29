  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root("welcome#index")

  resources :users, except: [:new, :create] 
  get("/register",   to: "users#new")
  post("/register",   to: "users#create")
end
