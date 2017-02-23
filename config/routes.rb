Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :contracts, only:[:new, :create, :show, :index]
  resources :customers, only:[:new, :create, :show]
  resources :equipment, only: [:new, :create, :show]
  resources :proposals, only: [:new, :create, :show]
end
