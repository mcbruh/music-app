Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resource :session
  resources :bands, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :albums, only: [:new]
  end
  resources :albums, only: [:create, :show, :edit, :update, :destroy] do
    resources :tracks, only: [:new]
  end
  resources :tracks, only: [:create, :show, :edit, :update, :destroy]
end
