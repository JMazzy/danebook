Rails.application.routes.draw do
  root "users#new"

  resources :users
  get '/timeline/:id', to: 'users#show', as: 'timeline'
  get '/friends/:id', to: 'users#index', as: 'friends'

  resources :profiles, only: [:show, :edit, :update]

  resource :session, :only => [:new, :create, :destroy]
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"

  resources :posts, only: [:index, :create, :destroy]
  get '/about/:id', to: 'profiles#show', as: 'about'

  resources :comments, only: [:create, :destroy]

  resources :likes, only: [:create, :destroy]

  resources :friendings, only: [:create,:destroy]

  resources :photos
end
