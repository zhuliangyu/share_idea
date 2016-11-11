Rails.application.routes.draw do

  root to: 'homes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :ideas, shallow: true do
    resources :comments, only: [:new, :create, :destroy]
    resources :likes, only: [:create, :destroy]
    resources :joins, only: [:create, :destroy]

  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
    collection do
      delete :destroy
    end

  end

end
