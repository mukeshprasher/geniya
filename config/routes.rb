Geniya::Application.routes.draw do
  get "ajax/portfolio_detail/:id" => 'ajax#portfolio_detail'
  resources :videos

  resources :advertisements

  resources :skills

  resources :tags

  resources :educations

  post '/rate' => 'rater#create', :as => 'rate'
  resources :newsletters
  match "/newsletters/:id/send_email", to: 'newsletters#send_email', via: 'post'

  resources :subscriptions

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  mount RailsAdminImport::Engine => '/rails_admin_import', :as => 'rails_admin_import'
  match "/portfolios", to: 'portfolios#index', via: 'get'
  match "/portfolios/:id", to: 'portfolios#category_index', via: 'get'
  match "/subscribe-plans", to: 'pages#price_table', via: 'get'
  resources :connections, only: [:create, :update, :destroy]

  resources :likes, only: [:create, :destroy]

  resources :comments, :only => [:create, :destroy]
  
  resources :albums

  resources :uploads
  
  resources :sub_categories

  resources :categories

  resources :updates, except: [:index, :new]

  resources :users do
    member do
      get :following, :followers
    end
  end
  match '/signup',  to: 'pages#price_table',            via: 'get'

  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  match "/register",  to: 'users#new',    via: 'get'
  match "/signup",  to: 'pages#price_table',    via: 'get'
  match "/signup",  to: 'pages#price_table',    via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/education', to: 'educations#new', via:'get'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#index'


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
