Rails.application.routes.draw do
  resources :customers
  resources :contracts, only:[:new, :create, :show]
end
