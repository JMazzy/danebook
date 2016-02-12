Rails.application.routes.draw do

  root "users#new"

  resources :users do
    resources :posts
  end

  resource :session, :only => [:new, :create, :destroy]
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"

  resources :profiles

end
