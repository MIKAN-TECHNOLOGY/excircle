Rails.application.routes.draw do
  devise_for :users
  root 'circles#index'
  resources :univs
  resources :circles do
    collection do
      get 'search'
    end
  end
  resources :tags
end
