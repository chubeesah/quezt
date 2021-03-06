Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations",
                                    sessions: "sessions" }
  
  get '/users/:id', to: 'users#show', as: 'user'
  patch '/users/:id', to: 'users#edit', as: 'edit_user'
  delete '/users/:id', to: 'users#destroy', as: 'destroy_user'

  post 'users/:id/polls', to: 'polls#create', as: 'new_poll'
  get 'users/:id/polls', to: 'polls#index', as: 'polls'
  get 'users/:id/polls/:id', to: 'polls#show', as: 'poll'
  delete 'users/:id/polls/:id', to: 'polls#destroy', as: 'destroy_poll'
  
  put 'users/:id/polls/:id/vote1', to: 'polls#vote1', as: 'vote_1'
  put 'users/:id/polls/:id/vote2', to: 'polls#vote2', as: 'vote_2'
  put 'users/:id/polls/:id/vote3', to: 'polls#vote3', as: 'vote_3'
  put 'users/:id/polls/:id/vote4', to: 'polls#vote4', as: 'vote_4'

  get 'polls', to: 'polls#nearby_polls', as: 'nearby_polls'
  
  root to: 'home#index'
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
