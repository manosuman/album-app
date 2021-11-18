Rails.application.routes.draw do
  # get 'tags/index'
  # get 'albums/index'
  devise_for :users
  resources :users do
    resources :albums do
      resources :images do
        resources :tags
      end
    end
  end
  
  # get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
  # root to: "albums#index"
end
