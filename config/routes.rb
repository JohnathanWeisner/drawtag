Rails.application.routes.draw do
  root 'home#index'
  resources :game
  resources :entry
end
