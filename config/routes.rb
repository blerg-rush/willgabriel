Rails.application.routes.draw do
  get '/check.txt', to: proc {[200, {}, ['it_works']]}
  root 'static#index'
  get 'blog', to: 'posts#index'
  get 'blog/:id', to: 'posts#show'
  resources :static, only: [:index, :new, :create]
  resources :posts
end
