Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/items', to: 'homes#index'
  get '/items/:id', to: 'homes#index'
  get '/users/:id', to: 'homes#index'

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show]
      resources :users, only: [:show]
      resources :current_user, only: [:index]
    end
  end
end
