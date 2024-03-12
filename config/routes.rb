Rails.application.routes.draw do
  # devise_for :users
  root "goals#index"

  post 'auth/register', to: 'auth#register'
  post 'auth/login', to: 'auth#login'

  resources :goals do
    resources :stats, only: [:create, :index, :destroy]
  end
end