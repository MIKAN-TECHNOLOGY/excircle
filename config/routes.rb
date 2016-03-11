Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :univs
  resources :circles do
    collection do
      get 'search'
    end
  end
  resources :tags
  root 'top#index'
end
