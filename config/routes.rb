Rails.application.routes.draw do
  # get 'home/home'

  resources :accepted_jobs
  resources :asking_prices
  resources :skills
  resources :job_postings
  resources :payment_informations
  # resources :buyers
  # resources :sellers
  
  resources :users
  resources :sessions
  get 'user/edit' => 'users#edit', :as => :edit_current_user
  get 'signup' => 'users#new', :as => :signup
  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout

  #custom routes
  get 'home', to: 'home#home', as: :home
  get 'dashboard', to: 'home#index', as: :dashboard
  get 'buy', to: 'job_postings#new', :as => :buy
  get 'sell', to: 'asking_prices#new', :as => :sell

  get 'initiate_job_buy/:jp_id' => 'accepted_jobs#initiate_buy', as: :initiate_job_buy
  get 'initiate_job_sell/:ap_id' => 'accepted_jobs#initiate_sell', as: :initiate_job_sell
  get 'make_accepted_job/:jp_id/:ap_id' => 'accepted_jobs#make', as: :make_accepted_job

  get 'review_provider/:aj_id' => 'accepted_jobs#review_provider', as: :review_provider
  post 'review_update_provider/:aj_id/' => 'accepted_jobs#review_update_provider', as: :review_update_provider
  get 'review_client/:aj_id' => 'accepted_jobs#review_client', as: :review_client
  post 'review_update_client/:aj_id/' => 'accepted_jobs#review_update_client', as: :review_update_client

  get 'buyer_complete' => 'accepted_jobs#buyer_complete', as: :buyer_complete
  get 'seller_complete' => 'accepted_jobs#seller_complete', as: :seller_complete

  get 'completed_jobs' => 'accepted_jobs#completed_jobs', as: :completed_jobs
  get 'active_jobs' => 'accepted_jobs#active_jobs', as: :active_jobs

  get 'user_reviews/:u_id' => 'users#user_reviews', as: :user_reviews

  #Static Pages
  get "/pages/:page" => "pages#show"

  # set the root url
  # root to: 'home#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root :to => 'home#home'
  
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
