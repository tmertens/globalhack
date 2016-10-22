require 'housing_first/api/base'

Rails.application.routes.draw do
  devise_for :users
  get 'pages/index'
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace 'rails_api' do
    resources :people
    resources :clients_organizations
    resources :organizations
  end

  # Grape API routes will be mounted under the `api` namespace
  mount ::HousingFirst::Api::Base => '/'

  namespace :organization do
    get '/' => 'dashboard#index'
  end
end
