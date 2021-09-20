Rails.application.routes.draw do
  get '/' => 'pages#welcome'

  use_doorkeeper

  resources :users, only: [:create]
  resources :animals, only: [:index]

  resources :subscription_plans, only: [:index, :show] do
    member do
      post :make_payment
    end
  end
end
