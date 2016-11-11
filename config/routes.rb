Rails.application.routes.draw do

  root 'home#index'
  get "/unauthorized" => "pages#unauthorized"

  resources :users

  resources :restaurants do
    resources :reviews, only: [:show, :create, :destroy]
    resources :reservations
  end
  resources :log_in, only: [:index, :create, :destroy]
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
