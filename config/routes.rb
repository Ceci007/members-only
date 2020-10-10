Rails.application.routes.draw do
  root 'tweets#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :tweets
  resources :users, except: [:new]
end
