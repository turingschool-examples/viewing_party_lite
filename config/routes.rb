# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'users/:id', to: "user#show"
  
  # get "users/:id/discover" to: "movies#index"
end
