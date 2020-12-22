Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

devise_scope :user do
  get 'privates', to: 'users/registrations#new_privates'
  post 'privates', to:'users/registrations#create_privates'
end

  resources :items do
    resources :comments, only: :create
    resources :orders,only:[:index,:new,:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
