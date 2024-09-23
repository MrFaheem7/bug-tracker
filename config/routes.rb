Rails.application.routes.draw do

  devise_for :users

  resources :projects do
    # Nested routes
    resources :bugs
  end
  
  get 'my_tasks', to: 'bugs#my_tasks'

  root  'projects#index'
end