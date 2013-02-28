CouponCorner::Application.routes.draw do

  resources :categories



  resources :line_items



  get "users/new"

  get "pages/home"
  get "pages/about_us"
  get "pages/sign_up"
  get "pages/thank_you"
  get "pages/client_sign_up"




  #controller :sessions do
  #  get 'login' => :new
  #  post 'login' => :create
  #  delete 'logout' => :destroy
  #end

  resources :coupons do
    collection do
      post :show_multiple
    end
  end

  resources :users
  resources :sessions
  resources :client, :controller => :users

  #map.resources :coupons, :collection => {:show_multiple => :post }

  #match '/your_cart' => "carts#your_cart", :as => "your_cart"
  match '/login' => "sessions#new", :as => "login"
  match '/logout' => "sessions#destroy", :as => "logout"


  root :to => "pages", :action => "home"

  #match '/display' => "coupons#display", :action => "print"
end


# The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'coupons/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => coupon.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :coupons

  # Sample resource route with options:
  #   resources :coupons do
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
  #   resources :coupons do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :coupons do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/coupons/* to Admin::couponsController
  #     # (app/controllers/admin/coupons_controller.rb)
  #     resources :coupons
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  #match '/logout' => "sessions#destroy", :as => "logout"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

