Rails.application.routes.draw do

  devise_for :users
  root to: "application#index"

  resources :users, only: :show do
    resources :posts, only: [:new, :create]
    resources :followers, only: [:new, :create, :destroy]
  end

  match('/search', { :via => :get, :to => 'users#search' } )

end
