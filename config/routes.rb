Rails.application.routes.draw do
  root to: 'characters#index'
  resources :actors
  resources :animes
  resources :characters
  get 'messages/new' => 'messages#new'
  post 'messages' => 'messages#create'
end
