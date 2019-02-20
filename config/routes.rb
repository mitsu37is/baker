Rails.application.routes.draw do
  root to: 'characters#index'
  resources :actors
  resources :animes
  resources :characters
end
