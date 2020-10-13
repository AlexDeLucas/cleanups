Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html 
  root 'homes#index'
  devise_for :users

  resources :cleanups do  
    resources :states
      resources :cities
  end
  
  resources :users, :only => :show

end
