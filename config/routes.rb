Rails.application.routes.draw do
  resources :equipment, only: [:new, :create, :show]
end
