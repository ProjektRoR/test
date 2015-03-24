Strona::Application.routes.draw do

  resources :microposts


#get "static_pages/home"
#get "static_pages/help"
  resources :opinions, only: [:create, :destroy]
  resources :books
  resources :users
  get "sessions/new"
  root to: "static_pages#home"
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  match '/opinia', to: 'books#dodaj_opinie'
  match '/pomoc', to: 'static_pages#help'
  match '/rejestruj', to: 'users#new'
  match '/logout', to: 'sessions#destroy'
  match '/powrut', to: 'users#show'
 # match '/user_info', to: 'users#user_info'
  get  'user_info'=> 'users#user_info'
  put 'update_user_info'=> 'users#update_user_info'
  match '/ksiazki_uzytkownika', to: 'books#wypisz_book_user'
  match '/search', to: 'books#search'
  match '/all_books', to: 'books#show_all_books'
  get 'static_pages/about_us'
  get 'static_pages/terms'
  get 'static_pages/contact'



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
