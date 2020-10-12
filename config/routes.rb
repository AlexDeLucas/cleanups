Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html 
  root 'homes#index'
  devise_for :users

  resources :cleanups do  
    resources :states
      resources :cities
  end
  
  get 'users/:user_id/cleanups', to: 'users#index'
  get '/users/:user_id/cleanups/:id/edit', to: 'users#edit'
  get '/users/:user_id/cleanups/:id', to: 'users#update'
  get '/users/:user_id/cleanups/:id', to: 'users#update'
  get '/users/:user_id/cleanups/:id', to: 'users#delete'
  resources :users do
    resources :cleanups
  end 

end
