Geniya::Application.routes.draw do
  resources :feedbacks

  resources :quotes

  resources :menuitems

  resources :menucategories

  resources :bussinesses

  resources :payments

  resources :payment_subscriptions

  resources :events

  resources :chats

  resources :shares

  resources :featureimgs

  resources :responses

  resources :jobs

  resources :activities
  resources :locations

  resources :pins

  resources :cities

  resources :states

  resources :countries

  resources :organizations

  resources :affiliations

  resources :covers

  resources :multiuploads

  resources :user_tags, only: [:create, :destroy]
  resources :user_skills, only: [:create, :destroy]

  get "ajax/portfolio_detail/:id" => 'ajax#portfolio_detail'
  get "ajax/chat/:id" => 'ajax#chat'
  get "ajax/mark_notifications_as_seen" => 'ajax#mark_notifications_as_seen'
  get "ajax/mark_network_notifications_as_seen" => 'ajax#mark_network_notifications_as_seen'
  get "ajax/mark_message_notifications_as_seen" => 'ajax#mark_message_notifications_as_seen'
  match "ajax/new_chats", to: 'ajax#new_chats', via: 'post'
  resources :videos

  resources :advertisements

  resources :skills

  resources :tags

  resources :educations
  
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end


  post '/rate' => 'rater#create', :as => 'rate'
  resources :newsletters
  match "/newsletters/:id/send_email", to: 'newsletters#send_email', via: 'post'
  match "/users/:id/profile_edit", to: 'users#profile_edit', via: 'get', as: :profile_edit
  match "/users/forgot_password", to: 'users#forgot_password', via: 'get', as: :forgot_password
  match "/users/:id/change_login", to: 'users#change_login', via: 'get'
  match "/users/recover_password", to: 'users#recover_password', via: 'post'
  match "/users/get_quote", to: 'users#get_quote', via: 'post'
  match "/business", to: 'users#bussiness', via: 'get'
  match "/business/:id/", to: 'users#show', via: 'get'
  match "/users/create_bussiness", to: 'users#create_bussiness', via: 'post'
  # Named route that can be invoked with change_password_url(id: user.id)
  get 'users/:id/change_password' => 'users#change_password', as: :change_password
  get 'businesses/:id/edit' => 'bussinesses#edit', via: 'get'
  get 'businesses/new/' => 'bussinesses#new', via: 'post'
  resources :subscriptions

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  mount RailsAdminImport::Engine => '/rails_admin_import', :as => 'rails_admin_import'
  match "/portfolios", to: 'portfolios#index', via: 'get'
  match "/portfolios/:id", to: 'portfolios#category_index', via: 'get'
  match "/subscribe-plans", to: 'pages#price_table', via: 'get', as: :price_table
  match "/geniyavideo", to: 'videos#geniya_videos', via: 'get'
  match "/other_locations", to: 'countries#other_locations', via: 'get'
  resources :connections, only: [:create, :update, :destroy]

  resources :likes, only: [:create, :destroy]

  resources :comments, :only => [:create, :destroy, :show]
  
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
