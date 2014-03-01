TodoList::Application.routes.draw do
  #resources :users
  resources :user_sessions
  match 'login' => 'user_sessions#create', :as => :login, via: [ :post]
  match 'logout/:id' => 'user_sessions#destroy', :as => :logout, via: [:get]
  match 'users/:id/edit' => 'users#edit', :as => :user_edit, via: [:get]
  match 'users/new' => 'users#new', :as => :user_new, via: [:get]
  match 'users/create' => 'users#create',  :as => :user_create, via: [:post]
  match 'users/:id' => 'users#update', :as => :user_update, via: [:post]

  #get "todos/index"
  #match "todos/delete" => "todos#delete", via: [:get, :post]
  ##match "todos/add" => "todos#add", :via => :get
  #match "todos/create" => "todos#create", :via => :post
  #match 'todos/complete' => 'todos#complete', :via => :post
  resources :todos
  

  root 'todos#show'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
