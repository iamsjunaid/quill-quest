Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        resources :posts, only: [:index] do
        end
      end
    end
  end
  
  root 'users#index', as: 'home'
end
