Rails.application.routes.draw do
  root 'static_pages#home'

  resources :categories, only: [:index]
  resources :products do
    resources :reviews
  end

  resources :reviews do
    resources :replies
  end

  namespace :admin do
    root 'admin_pages#home'
    resources :products, only: [:new, :create, :index, :show]
    resources :categories, only: [:new, :create, :index]
    resources :users, only: [:index]
    resources :reviews
    resources :replies

  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
