Rails.application.routes.draw do
  resources :contracts, only:[:new, :create, :show, :index] do
    resources :delivery_receipts, only:[:create]
  end
  resources :customers
  resources :equipment, only: [:new, :create, :show]
  resources :delivery_receipts, only: [:show]
end
