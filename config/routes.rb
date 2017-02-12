Rails.application.routes.draw do
  get 'courses/index'

  get 'greeter/hi' => "greeter#hello"
  get 'greeter/goodbye'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'courses#index'
end
