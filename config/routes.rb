SfByMouth::Application.routes.draw do
  root to: "restaurants#index"
  resources :restaurants
  resources :users
  resources :sessions, only: [:create, :destroy, :index]
  resources :listings, only: [:create, :edit, :index, :show, :new]
  resources :lists, only: [:create, :edit, :index, :show, :new, :edit]
end
