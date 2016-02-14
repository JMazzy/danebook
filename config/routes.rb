Rails.application.routes.draw do

  root "users#new"

  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments
    resources :likes
  end

  resources :comments do
    resources :likes
  end

  resource :session, :only => [:new, :create, :destroy]
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"

  resources :profiles

end
