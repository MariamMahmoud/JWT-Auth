Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :show]
  # name friendly route for user creation
  post 'auth/register', to: 'users#create'
  post 'auth/login', to: 'users#login'


  resources :statuses, only: [:create, :show]
  
end
