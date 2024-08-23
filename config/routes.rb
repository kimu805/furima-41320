Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items do
    resources :purchases, only: [:index, :create]
    resource :likes, only: [:create, :destroy]
    collection do
      get "search"
    end
  end
end
