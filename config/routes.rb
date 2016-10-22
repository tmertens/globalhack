require 'housing_first/api/base'

Rails.application.routes.draw do
  resources :clients_organizations
  resources :organizations
  devise_for :users
  get 'pages/index'
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Grape API routes will be mounted under the `api` namespace
  mount ::HousingFirst::Api::Base => '/'
end
