SfByMouth::Application.routes.draw do
  root to: "restaurants#index"
  resources :restaurants
  resources :users
  resources :sessions, only: [:create, :destroy, :index]
  resources :listings, only: [:create, :edit, :index, :show]
end
