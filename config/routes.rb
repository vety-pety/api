Rails.application.routes.draw do
  get '/' => 'pages#welcome'

  use_doorkeeper

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :animals
end
