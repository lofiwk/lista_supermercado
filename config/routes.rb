Rails.application.routes.draw do
  resources :items, only: [:index, :create, :destroy]
  root 'items#index'
end
