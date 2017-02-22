Rails.application.routes.draw do
  resources :contracts, only:[:new, :create, :show, :index]
  resources :customers
  resources :equipment, only: [:new, :create, :show]
  resources :prices, only:[:new, :create, :show]
end
