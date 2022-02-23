Rails.application.routes.draw do

  root 'pages#home'
  get 'search', to: 'pages#search'

  resources :accounts
  get 'signup', to: 'accounts#new'
  post 'signup', to: 'accounts#create'

  resources :sessions
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy'

  resources :users
  
  resources :posts do
    resources :comments
  end
  
  get 'new/like', to: 'likes#create'
  get 'like', to: 'likes#destroy'
  #resources :connections
  get 'create/connection', to: 'connections#create'
  get 'connection', to: 'connections#destroy'
  
end
