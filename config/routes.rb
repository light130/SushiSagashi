Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/sign_up/confirmation' => 'users/registrations#confirmation'
  end
  root to: 'home#index'
  resources :users, only: [:show] do
    member do
      get :likes
    end
  end
  resources :shops do
    resources :comments, only: [:create, :index, :destroy]
  end
  resources :likes, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
