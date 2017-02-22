Rails.application.routes.draw do
  resources :customers
  resources :equipment, only: [:new, :create, :show]
  resources :contracts, only:[:new, :create, :show]
end
