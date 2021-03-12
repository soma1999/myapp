Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "homes#index" 
  resources :homes, only: [:index] do
    collection do
      post 'new_guest_user'
      post 'new_guest_celeb'
    end
  end

  resources :users, only:  [:show]
  resources :cards, only: [:new, :create]

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
    resources :messages, only: [:create, :destroy] 
    resources :prices, only: [:create] do
      resources :orders, only: [:create]
    end
    resources :likes, only: [:create, :destroy]
  end

  resources :inquiry, only: [:index] do
    collection do
      post 'confirm'
      post 'thanks'
    end
  end

end
