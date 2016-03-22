Rails.application.routes.draw do
  root "stories#index"

  resources :users
  get '/timeline/:id', to: 'users#show', as: 'timeline'
  get '/friends/:id', to: 'users#index', as: 'friends'

  resources :profiles, only: [:show, :edit, :update]

  resource :session, :only => [:new, :create, :destroy]
  get "login" => "users#new"
  delete "logout" => "sessions#destroy"

  resources :posts, only: [:index, :create, :destroy]
  get '/about/:id', to: 'profiles#show', as: 'about'

  resources :comments, only: [:new, :create, :destroy]

  resources :likes, only: [:create, :destroy]

  resources :friendings, only: [:create,:destroy]

  resources :photos

  resources :stories, only: [:index]
end
