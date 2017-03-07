Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  resources :groups do
    resources :messages, only: [:create, :index]
  end
end

