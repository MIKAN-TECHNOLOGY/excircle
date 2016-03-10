Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :univs
  resources :circles do
    collection do
      get 'search'
    end
  end
  resources :tags
  root 'top#index'
end
