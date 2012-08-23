Ad::Application.routes.draw do
  
  resources :widgets

  get "widgets/index"

  get "widgets/create"

  get "widgets/edit"

  get "widgets/destory"

  resources :categories

  resources :advs

  get "advs/index"
  get "advs/create"
  get "advs/delete"
  get "advs/edit"
  
  
  get "sessions/new"
  get "sessions/create"
  get "sessions/failure"
  
  
  resources :languages

  resources :sessions

  resources :users
  
  root :to => "home#index"
 
  
  get   '/login', :to => 'sessions#new', :as => :login
  get '/all', :to => 'users#index', :as => :all
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'
  match "/signout" => "sessions#destroy", :as => :signout
  
  
  
  match '/home/index', :to => 'home#index'
  match '/advs', :to => 'advs#index'
  match '/advs/new', :to => 'advs#new' 
  match '/advs/create', :to => 'advs#create'
  match 'advs/show', :to => 'advs#show'
  match '/widgets', :to => 'widgets#index'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
