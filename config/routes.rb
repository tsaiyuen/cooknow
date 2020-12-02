Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :recipes
  resources :users, only: [:index] do
    resources :saved_recipes
  end
end
