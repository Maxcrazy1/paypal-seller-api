Rails.application.routes.draw do
  devise_for :users, skip: :all

  devise_scope :user do
    scope :auth, defaults: { format: :json } do
      post   '/signin',       to: 'sessions#create'
      delete '/signout',      to: 'sessions#destroy'
      post   '/signup',       to: 'registrations#create'
      put    '/account',      to: 'registrations#update'
      delete '/account',      to: 'registrations#destroy'
      put    '/password',     to: 'devise/passwords#update'
      post   '/password',     to: 'devise/passwords#create'
      get    '/confirmation', to: 'devise/confirmations#show'
      post   '/unlock',       to: 'devise/unlocks#create'
      get    '/unlock',       to: 'devise/unlocks#show'
    end
  end


  namespace :api do
  namespace :v1 do

get 'orders', to: 'orders#index'
post 'orders', to: 'orders#store'
get 'orders/:id', to: 'orders#show'
put 'orders/:id', to: 'orders#update'
delete 'orders/:id', to: 'orders#destroy'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
