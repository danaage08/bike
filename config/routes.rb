Rails.application.routes.draw do
  resources :chats
  get 'reviews/new'
  get 'reviews/create'
  resources :orders, only: [:new, :create]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { sessions: 'sessions' }
  root 'pages#home'
  get 'pages/delivery'
  get 'pages/rules'
  get 'pages/contacts'
  get 'pages/about'
  get 'pages/message'
  resources :feedback, only: [:create]

    # config/routes.rb
    resources :orders do
      member do
        patch 'cancel' # маршрут для отмены заказа
      end
    end

    # config/routes.rb
    resources :orders do
      member do
    get 'extend' # маршрут для продления заказа
  end
end

get 'reviews', to: 'reviews#index'

resources :orders do
  resource :review, only: [:new, :create]
end

get 'profile', to: 'profiles#show', as: :profile

end