Rails.application.routes.draw do

  root 'home#index'

  resources :reservations

  resources :users

  resources :restaurants do
    resources :reviews, only: [:show, :create, :destroy]
  end
  resources :log_in, only: [:index, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
