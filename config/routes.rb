Rails.application.routes.draw do
  root to: 'actors#index'
  resources :actors
  resources :animes
  resources :characters
end
