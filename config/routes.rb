Rails.application.routes.draw do
  get '/check.txt', to: proc {[200, {}, ['it_works']]}
  root 'static#index'
  resources :static, only: [:index, :new, :create]
  resources :posts
  resources :sessions, only: [:new, :create, :destroy]
end
