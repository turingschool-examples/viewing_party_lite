# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'landing_page#index'

  resources :users, only: [:new]
end
