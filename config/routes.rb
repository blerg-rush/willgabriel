Rails.application.routes.draw do
  get '/check.txt', to: proc {[200, {}, ['it_works']]}
  root 'static#index'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get 'sessions', to: 'sessions#new'
  resources :static, only: [:index, :new, :create]
  resources :posts
  resources :sessions, only: [:new, :create, :destroy]
end
