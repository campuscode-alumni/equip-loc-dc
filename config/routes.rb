Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :contracts, only:[:new, :create, :show, :index] do
    resources :delivery_receipts, only:[:create]
  end
  resources :customers, only:[:new, :create, :show]
  resources :equipment, only: [:new, :create, :show]
  resources :proposals, only: [:new, :create, :show]
  resources :prices, only:[:new, :create, :show]
  resources :delivery_receipts, only:[:show]
end
