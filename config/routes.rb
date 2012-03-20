BootstrapOnRails::Application.routes.draw do
  


  resources :contact_people do
    member do
      get 'crop'
      put 'crop_update'
    end
  end
  
  resources :menus
  resource :locale
  
  resources :backdrops do
    member do
      get 'crop'
      put 'crop_update'
    end
  end

  resources :gallery_images do
    member do
      get 'crop'
      put 'crop_update'
    end
  end

#  resources :pages

  namespace :admin do
    resources :companies do
      resources :pages
      #member do
      #  get 'crop'
      #  put 'crop_update'
      #end
    end
  end
  
  resources :pages do
    collection { post :sort }
  end
  
  resources :menus do
    resources :pages do
      collection { post :sort }
    end
  end
    
  resources :companies do
    resources :contact_people do
      collection { post :sort }
      member do
        get 'crop'
        put 'crop_update'
      end
    end
    resources :menus do
      collection { post :sort }
    end
    resources :pages
    
    #member do
    #  get 'crop'
    #  put 'crop_update'
    #end
  end
  
  resources :pages do
    resources :gallery_images
    member do
      get 'crop'
      put 'crop_update'
    end
    #resources :pages
  end

  get "admin/index"

  root :to =>  "home#index"
  
  #  get "password_resets/new"
  get "sign_up" => "users#new", :as => "sign_up"
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  
  resources :users do
    member do
      get 'crop'
      put 'crop_update'
    end
  end
  
  resources :sessions
  resources :password_resets
  
  get "no_access/index"
  resources :vcard

  
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
