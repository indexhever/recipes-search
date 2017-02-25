Rails.application.routes.draw do
  root 'static_pages#home'

  get 'help' => 'static_pages#help'

  get 'about' => 'static_pages#about'

  get 'contact' => 'static_pages#contact'

  get 'signup' => 'users#new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  get 'recipes/index'
  
  resources :users
  resources :account_activations, only: [:edit]

  #resources :microposts
  #resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #root 'recipes#index'
  
  #root 'users#index'
end
