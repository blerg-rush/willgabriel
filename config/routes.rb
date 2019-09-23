Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  get 'posts/edit'
  get 'posts/create'
  get 'posts/update'
  get 'posts/destroy'
  get '/check.txt', to: proc {[200, {}, ['it_works']]}
  root 'static#index'
  get 'static/index'
  get 'static/about'
end
