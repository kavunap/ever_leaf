Rails.application.routes.draw do
  resources :labels
  resources :tasks
  root 'tasks#index'
  
  resources :users
  resources :sessions
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  #get 'admin', to: 'users#admin', as: 'admin'


  namespace :admin do
    resources :users
  end

  #devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
