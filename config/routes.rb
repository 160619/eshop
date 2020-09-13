Rails.application.routes.draw do
  root 'static_pages#home'

  resources :categories, only: [:index, :new, :create]
  resources :products do
    resources :reviews
  end

  resources :reviews do
    resources :replies
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
