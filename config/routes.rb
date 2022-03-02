
require 'api_constraints'
Rails.application.routes.draw do
namespace :api do
  scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
    resources :users, only: [:create, :show] do
      resources :books, only: [:create, :index] do
        resources :measurements, only: [:create]
      end
    end
    resources :categories, only: [:create, :index]
    get 'user-measurements', to: 'measurements#index'
    post 'user-measurement', to: 'measurements#create'
  end
end 
  post 'signup', to: 'users#create'
  post 'auth/login', to: 'authentication#authenticate'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
