Rails.application.routes.draw do
  resources :contracts, only:[:new, :create, :show, :index] do
    resources :return_receipts, only: [:new, :create]
  end
  resources :return_receipts, only: [:show]
  resources :customers
  resources :equipment, only: [:new, :create, :show]
  resources :prices, only:[:new, :create, :show]
end
