Rails.application.routes.draw do
  root 'welcome#landing'

   resources :users
end
