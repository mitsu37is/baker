Rails.application.routes.draw do
  get 'comparisons/index'
  get 'comparisons/show'
  devise_for :users
  root to: 'characters#index'
  resources :actors
  resources :animes
  resources :characters
  resources :anime_characters
  resources :actor_characters
  get 'messages/new' => 'messages#new'
  post 'messages' => 'messages#create'
end
