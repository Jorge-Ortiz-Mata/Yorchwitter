Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/edit'
  get 'posts/show'

  root 'pages#home'

  resources :accounts
  get 'signup', to: 'accounts#new'
  post 'signup', to: 'accounts#create'

  resources :sessions
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy'

  resources :users

end
