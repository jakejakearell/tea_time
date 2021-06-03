Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'user/:id/subscriptions', to: 'user_subcriptions#index'
      post 'subscription', to: 'user_subcriptions#create'
      put 'subscription', to: 'user_subcriptions#update'
    end
  end
end
