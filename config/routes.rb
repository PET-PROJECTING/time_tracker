Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :admin_users
      resources :posts

      root to: "users#index"
  end

  resources :posts do
    get '/page/:page', action: :index, on: :collection
  end

  devise_for :users, skip: [:registration]
  root "static_pages#index"
end
