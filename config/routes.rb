Rails.application.routes.draw do
  get '/' => 'pages#welcome'

  use_doorkeeper

  resources :users, only: %w[create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :animals
end
