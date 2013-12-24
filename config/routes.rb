Sagarmitra::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }
  
  devise_scope :user do
     get "sign_in", :to => "users/sessions#new"
   end
#  TODO Integrate initiativers core engine for user
#   mount InitiativersCoreEngine::Engine, at: "/initiativers"
  resources :school_volunteers
  resources :school_plastic_collection_sources
  resources :plastic_collection_sources
  resources :school_contacts
  resources :presentations

  resources :schools do
     member do
         get :presentation
       end
  end


     root 'program#index'
   
     get '/calender' => 'program#calender'

  
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

    resources :school_roles
    resources :school_media
    resources :school_types
end






end
