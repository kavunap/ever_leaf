Rails.application.routes.draw do
  #get 'sessions/new'
  #resources :users
  #get '/signup' => 'users#new'
  
  #get '/login' => 'sessions#new'
  
  #get '/logout' => 'sessions#destroy'
  #get '/dashboard' => 'users#dashboard'
  # post '/users' => 'users#create'
  # post '/login' => 'sessions#create'
  resources :tasks
  root 'tasks#index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions
  #devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
