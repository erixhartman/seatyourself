Rails.application.routes.draw do
  
  root 'home#index'

  resources :reservations, only: %i(new index edit destroy show)

  resources :users, only: %i(new index edit destroy show)

  resources :restaurants, only: %i(new index edit destroy show)


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
