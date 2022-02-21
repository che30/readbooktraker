require 'api_version'
Rails.application.routes.draw do
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :users do
      resources :measurments
      resources :books
    end
    resources :cats do
      resources :books
    end
    resources :measurments
  end
  post 'signup', to: 'users#create'
  post 'auth/login', to: 'authentication#authenticate'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
