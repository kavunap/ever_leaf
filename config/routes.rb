Rails.application.routes.draw do
  get 'auth/login'
  post 'auth/login_auth'
  get 'auth/signup'
  post 'auth/create'
  get 'auth/dashboard'
  #devise_for :users
  #resources :auths
  resources :tasks
  root 'tasks#index'
  #devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
