Rails.application.routes.draw do
  devise_for :users
  root to: 'projects#index'

  resource :account

  resources :projects do
    resources :integrations do
      member do
        put 'add'
      end
    end
  end

  post '/manifest', to: 'realtime#manifest'
end
