Rails.application.routes.draw do
  
  get 'site/about'
  get 'site/help'
  get 'admin/index'

  resources :categories
  resources :businesses
  
  devise_for :users

  root :to=> 'site#home'
end
