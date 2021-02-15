Rails.application.routes.draw do

  devise_for :users
  root to: "homes#index" 
  resources :celebs, only: [:new, :create, :show] do
    collection do
      get 'new_second'
      post 'login'
    end
  end

  # get '/login', to: 'celebs#new_second'
  # post '/login', to: 'celebs#login'
end
