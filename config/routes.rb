Rails.application.routes.draw do
  resources :companies do
    collection do
      get :search
      get :result
    end
    resources :matters do
      resources :logs
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
