Rails.application.routes.draw do

  resources :contracts, only:[:new, :create, :show, :index] do
    resources :return_receipts, only: [:new, :create]
    resources :delivery_receipts, only:[:create]
  end

  resources :return_receipts, only: [:show]
  resources :customers, only:[:new, :create, :show]

  resources :equipment, only: [:new, :create, :show]
  resources :proposals, only: [:new, :create, :show]
  resources :prices, only:[:new, :create, :show]
  resources :delivery_receipts, only:[:show]

  root to: 'welcome#index'
end
