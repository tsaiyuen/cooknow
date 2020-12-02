Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :recipes
  resources :users, only: [:index]
  resources :saved_recipes
end
