SfByMouth::Application.routes.draw do
  root to: "restaurants#index"
  resources :restaurants
  resources :users
end
