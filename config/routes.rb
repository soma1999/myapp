Rails.application.routes.draw do

  devise_for :users
  root to: "homes#index" 
  resources :celebs, only: [:new, :create, :show, :destroy] do
    collection do
      get 'new_second'
      post 'login'
    end
    post "/rooms", to: 'rooms#find_or_create_by'
  end
  resources :rooms, only: [:show] do
    resources :user_comments, only: [:create] 
    resources :celeb_comments, only: [:create]
  end
end
