Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  resources :microposts
  resources :users
  get 'recipes/index'

  get 'greeter/hi' => "greeter#hello"
  get 'greeter/goodbye'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#index'
  #root 'users#index'
end
