Rails.application.routes.draw do

  devise_for :users
  resources :alerts

  get 'map/index'

  namespace :api, defaults: {format: :json}  do
    with_options :except => [:edit, :new] do |option|
      resources :users, :only => [:show, :update, :create, :destroy], :shallow => true do
        option.resources :alerts
      end
      resources :alerts, :only => [:index, :show, :update, :create, :destroy]
      resources :alert_rankings, :only => [:show, :update, :create, :destroy]
      resources :alerts_images, :only => [:show, :update, :create, :destroy]

    end
    resources :sessions, :only => [:create, :destroy]
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'map#index'

  get 'dashboard/:iso' => 'dashboard#country'
  get 'index' => 'pages#indecx'
  get 'countries' => 'pages#countries'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
