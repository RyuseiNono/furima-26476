Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users#, controllers: {
    # omniauth_callbacks: 'users/omniauth_callbacks',
    # registrations: 'users/registrations'
  # }
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
    resources :messages, only: [:create]
  end
end
