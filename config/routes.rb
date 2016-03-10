Rails.application.routes.draw do
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
