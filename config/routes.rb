Micropost::Application.routes.draw do
  get "home/index"
  # get "static_pages/comming"
  # resources :static_pages/comming

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "static_pages/about"
  get "static_pages/contact"
  get "static_pages/faq"
  get "static_pages/services"
  get "static_pages/blog"
  get "static_pages/blog_post"

  # get 'tags/:tag', to: 'pets#index', as: :tag



  namespace :admin do
    resources :pets

  end

   namespace :admin do
    resources :institutions
  end

  namespace :admin do
    resources :posts
  end

  resources :pets

  resources :institutions

  devise_for :users
  resources :posts

  resources :users
  root 'home#index'

  # get 'tags/:tag', to: 'pets#index', as: :tag

  get 'tags/:tag', to: 'pets#index', as: :tag
    resources :pets do
     collection do
     get :search

    end   
 end

resources :pet do
  collection do
    match 'search' => 'pet#search', via: [:get, :post], as: :search
  end
end



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
