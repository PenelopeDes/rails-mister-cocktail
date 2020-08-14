Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :cocktails, only: [:show, :new, :create, :destroy] do
    resources :doses, only: [:index, :new, :create, :destroy]
  end
end
