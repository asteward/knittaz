Rails.application.routes.draw do

  devise_for :users
  root to: "application#index"

  resources :users do
    resources :posts
    resources :followers
  end

end
