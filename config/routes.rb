# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  resources :users do
    resources :movies, only: [:show]
  end
end
