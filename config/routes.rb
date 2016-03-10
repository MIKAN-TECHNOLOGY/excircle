Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :univs
  resources :circles do
    collection do
      get 'search'
    end
  end
  resources :tags
  root 'top#index'
  get 'users/:id' => 'users#show'
end
