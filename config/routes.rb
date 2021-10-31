Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  resources :users do
    resources :measurements
  end
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
