Zsdou::Application.routes.draw do 
  

  resources :listing_cards

  resources :cards

  resources :users 
  resources :sessions
  
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  
  get "sign_up" => "users#new", :as => "sign_up"
  get "user_show" => "users#show", :as => "user_show"
  get "change_pass" => "users#change_pass", :as => "change_pass"
  put "pass_update" => "users#pass_update", :as => "pass_update"
  
  get "book_show" => "memowords#book_show", :as => "book_show"
  get "book1" => "memowords#book1", :as => "book1"
  get "book2" => "memowords#book2", :as => "book2"
  get "book3" => "memowords#book3", :as => "book3"
  get "memowords/edit" => "memowords#book_edit", :as => "memowords_edit"
  
  get "addtestfile" => "cards#testfile", :as => "addtestfile"
  
  resources :memowords
  
  root :to => "sessions#new"
  

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
