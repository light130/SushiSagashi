Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/sign_up/confirmation' => 'users/registrations#confirmation'
  end
  root to: 'home#index'
  get '/about', to: 'home#about'
  get '/contact', to: 'home#contact'
  resources :users, only: [:show] do
    member do
      get :likes
    end
  end
  resources :shops do
    resources :comments, only: [:create, :index, :destroy] do
      resources :comment_favorites, only: [:create, :destroy]
    end
  end
  resources :shop_favorites, only: [:create, :destroy]
end
