Rails.application.routes.draw do

  devise_for :users
  root to: "homes#index" 
  resources :celebs, only: [:new, :create, :show, :destroy] do
    collection do
      get 'new_second'
      post 'login'
    end
  end

end
