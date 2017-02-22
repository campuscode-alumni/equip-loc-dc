Rails.application.routes.draw do
  resources :equipment, only: [:new, :create, :show]
  resources :contracts, only:[:new, :create, :show]
  resources :prices, only:[:new, :create, :show]
end
