Rails.application.routes.draw do

  root 'home#index'

  get 'home/index'
  get 'users/my_portfolio'
  get 'users/search'
  get 'users/show'
  get 'user_cryptos/create'
  get 'user_cryptos/destroy'
  get 'cryptos/search'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
