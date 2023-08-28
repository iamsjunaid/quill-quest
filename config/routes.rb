Rails.application.routes.draw do
  resources :users do
    resources :posts, only: [:index, :show]
  end
end
