Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :recipes do
    resources :reviews
  end
  resources :users, only: [:index]
  resources :saved_recipes
end
