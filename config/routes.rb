Rails.application.routes.draw do
  devise_for :admins
  devise_scope :admin do
    match '/sessions/admin', to: 'devise/sessions#create', via: :post
  end
  get '/check.txt', to: proc {[200, {}, ['it_works']]}
  root 'static#index'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get 'sessions', to: 'sessions#new'
  resources :posts
  resources :projects
  resources :sessions, only: [:new, :create, :destroy]
  resources :static, only: [:index, :new, :create]
end
