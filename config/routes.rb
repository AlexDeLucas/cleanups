Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html 
  root 'homes#index'
  devise_for :users

  resources :cleanups   
  resources :states do
      resources :cities
  end
  
  resources :users, :only => :show
  resources :details, :only => :index

  namespace :admin do 
    resources :users, only: [:index, :destroy]
    resources :cleanups, only: [:index, :destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :cleanups, only: [:index]
    end
  end

end
