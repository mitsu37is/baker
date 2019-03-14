Rails.application.routes.draw do
  root to: 'characters#index'
  devise_for :users
  resources :actors
  resources :animes
  resources :characters
  resources :anime_characters
  resources :actor_characters
  get 'messages/new' => 'messages#new'
  post 'messages' => 'messages#create'
  get 'comparisons/index'
  get 'comparisons/show'
end
