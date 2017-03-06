Rails.application.routes.draw do
  devise_for :staffs, controllers: {sessions: "staffs/sessions"}
  devise_for :users, controllers: {registrations: "users/registrations"}
  root "pages#home", page: "home"
  devise_scope :staff do
    get "staffs/pages/*page", to: "staffs/pages#show", page: "home", as: "staff_root"
  end
  namespace :admin do
    resources :orders, only: [:index, :edit, :update]
    resources :users, only: [:index, :delete]
    resources :staffs, except: [:show]
    resources :products, except: [:show]
  end

  get "owners/*page", to: "owners/pages#show", page: "home", as: "owner_root"
  namespace :owners do
    resources :orders, only: [:index, :update]
  end

  resources :products, only: [:show, :index]
  resources :order_details
  resources :orders
end
