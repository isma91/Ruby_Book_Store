Rails.application.routes.draw do
  root 'users#login'

  get 'login'            => 'users#login'
  get 'user/login'       => 'users#login'
  get 'signup'           => 'users#new'
  get 'user/create'      => 'users#new'
  get 'books'            => 'books#index'
  get 'book/new'         => 'books#new'
  get 'customer/new'     => 'customers#new'
  get 'customers'        => 'customers#index'
  get 'customer/create'  => 'customers#new'
  get 'logs'             => 'logs#index'

  post "user/login"      => "users#connexion"
  post 'user/create'     => 'users#create'
  post 'logout'          => 'sessions#logout'
  post 'book/create'     => 'books#create'
  post 'customer/create' => 'customers#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
