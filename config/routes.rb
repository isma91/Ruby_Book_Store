Rails.application.routes.draw do
  root 'users#login'

  get 'login' => 'users#login'
  get 'signup' => 'users#new'
  get 'books' => 'books#index'
  get 'book/new' => 'books#new'

  post "user/login" => "users#connexion"
  post 'user/create' => 'users#create'
  post 'logout' => 'sessions#logout'
  post 'book/create' => 'books#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
