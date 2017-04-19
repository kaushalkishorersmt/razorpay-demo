Rails.application.routes.draw do

  root to: 'products#index'

  devise_for :users
  post '/purchase' => 'orders#purchase_status'
  resources :products
end
