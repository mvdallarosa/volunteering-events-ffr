Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :projects do
    resources :events do
      resources :registrations, only: [ :new, :create, :edit, :update, :destroy ]
    end
  end
  get '/registrations', to: 'pages#registrations', as: 'user_registrations'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
