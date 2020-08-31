Rails.application.routes.draw do
  resources :categories
  resources :foods
  resources :friendships
  resources :users, only: [:create]

  post '/login', to: 'users#login'
  
end
