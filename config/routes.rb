Rails.application.routes.draw do
  root 'users#login'

  get 'login' => 'users#login'
  get 'signup' => 'users#new'

  post "user/login" => "users#connexion"
  post 'user/create' => 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
