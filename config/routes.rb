Sagarmitra::Application.routes.draw do


  resources :school_volunteers

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }
  
  devise_scope :user do
     get "sign_in", :to => "users/sessions#new"
   end
#  TODO Integrate initiativers core engine for user
#   mount InitiativersCoreEngine::Engine, at: "/initiativers"
  
  resources :school_media



  resources :school_plastic_collection_sources

  resources :plastic_collection_sources

  resources :school_types



  resources :school_contacts

  resources :school_roles



  resources :presentations

  resources :schools do
     member do
         get :presentation
       end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
     root 'program#index'
   
     get '/calender' => 'program#calender'
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
  
  match   'initiative', to:  'initiative#concept' , via: [:get]
  match   'initiative/concept', to:  'initiative#concept' , via: [:get]
  match   'initiative/team', to:  'initiative#team' , via: [:get]
  match   'initiative/contact', to:  'initiative#contact' , via: [:get]



#admin

namespace :admin do
  get '/index' => 'program#index'
    resources :plastic_collection_events
    resources :plastic_collection_sources
    resources :presentations
    resources :schools
    resources :presentation_types

    resources :roles
    resources :program_states
    resources :program_volunteers

end






end
