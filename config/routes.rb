Rails.application.routes.draw do

  devise_for :users
  
  
  resources :projects do
    # Nested routes
    resources :bugs, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  
  get 'my_tasks', to: 'bugs#my_tasks'

  root to: 'projects#index'
end