SewAuto::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'login' => 'user#login', as: :login
  post 'login' => 'user#authenticate'
  post 'logout' => 'user#logout'

  #get 'treatment_plants/:id' => 'treatment_plant#show', as: :treatment_plant
  #get 'treatment_plants/new' => 'treatment_plant#new', as: :new_treatment_plant
  
resources :treatment_plants, only: [:new, :create,:show, :index] do
  resources :pumping_stations, only: [:new,:create]
end


root 'treatment_plants#index'

put '/treatment_plants' => 'treatment_plants#update'
put '/pumping_stations' => 'pumping_stations#update'
put '/manhole_sensors' => 'manhole_sensors#update'
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
