Rails.application.routes.draw do
  #login page as root
  root 'users#login'
  #aliases for login page
  get 'login' => 'users#login'
  get 'user/login' => 'users#login'
  #aliases for signup page
  get 'signup' => 'users#new'
  get 'user/create' => 'users#new'

  post "login" => "users#login"
  post 'user/create' => 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
