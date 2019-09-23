Rails.application.routes.draw do
  get '/check.txt', to: proc {[200, {}, ['it_works']]}
  root 'static#index'
  get 'static/index'
  get 'static/about'
  resources :posts
end
