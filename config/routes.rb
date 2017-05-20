Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  resources :users, only: :search do
    collection do
      get 'search'
    end
  end
  resources :groups do
    resources :messages, only: [:create, :index]
  end
end
