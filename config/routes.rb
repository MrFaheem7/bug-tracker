Rails.application.routes.draw do

  devise_for :users
  
  
  resources :projects do
    # Nested routes
    resources :bugs, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  
  root to: 'projects#index'
end