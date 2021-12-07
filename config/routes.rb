Rails.application.routes.draw do

  devise_for :users, skip: %i[registrations sessions passwords]
  devise_scope :user do
      post   '/signup',       to: 'registrations#create'
      post '/login',      to: 'sessions#create'
      delete '/logout',      to: 'sessions#destroy'
  end


  namespace :api do
  namespace :v1 do

get 'orders', to: 'orders#index'
post 'orders', to: 'orders#store'
get 'orders/:id', to: 'orders#show'
put 'orders/:id', to: 'orders#update'
delete 'orders/:id', to: 'orders#destroy'

      put   'users/:id',       to: 'user#update'

    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
