Rails.application.routes.draw do
  root "goals#index"
  resources :goals do
    resources :stats, only: [:create, :index, :destroy]
  end
end