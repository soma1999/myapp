Rails.application.routes.draw do


  devise_for :users
  root to: "homes#index" 
  resources :homes, only: [:index]

  resources :users, only:  [:show]

  resources :celebs, only: [:new, :create, :show, :destroy] do
    collection do
      get 'new_second'
      post 'login'
    end
    post "/rooms", to: 'rooms#find_or_create_by'

  end

  resources :rooms, only: [:show] do
    get 'search', to: 'searches#search'
    resources :blocks, only: [:create, :destroy]
    resources :messages, only: [:create] 
  end


end
