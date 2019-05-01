Rails.application.routes.draw do

  
  root 'static_pages#home'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/welcome/:username', to: 'static_pages#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :gossips
  resources :users
  resources :cities
  resources :comments


end
