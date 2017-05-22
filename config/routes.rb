Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  resources :users, only: :search do
    get 'search', on: :collection
  end
  resources :groups do
    resources :messages, only: [:create, :index]
  end
end
