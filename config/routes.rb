Rails.application.routes.draw do
  root 'static#index'
  get 'static/index'
  get 'static/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
