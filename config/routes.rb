Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  get 'static_pages/about'

  get 'static_pages/contact'

  resources :microposts
  resources :users
  get 'recipes/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #root 'recipes#index'
  root 'static_pages#home'
  #root 'users#index'
end
