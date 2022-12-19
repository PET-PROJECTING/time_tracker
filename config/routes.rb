Rails.application.routes.draw do
  get 'controll/inside'
  get 'controll/outside'
  get 'controll/classification'
  get 'controll/attacks'

  namespace :admin do
      resources :users
      resources :admin_users
      resources :posts

      root to: "users#index"
    end
  resources :posts
  devise_for :users, skip: [:registration]
  root "static_pages#index"
end
