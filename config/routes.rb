Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :payment_requests, only: [:index, :show, :create, :new]
  root to: 'payment_requests#index'
end
