Rails.application.routes.draw do
  root 'tweets#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :tweets, except: [:edit, :show]
  resources :users, except: [:new]
end
