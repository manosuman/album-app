Rails.application.routes.draw do
  # get 'tags/index'
  # get 'albums/index'
  resources :albums do
    resources :images do
      resources :tags
    end
  end
  devise_for :users
  # get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
