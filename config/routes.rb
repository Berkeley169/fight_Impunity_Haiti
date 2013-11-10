FightImpunityHaiti::Application.routes.draw do

  resources :tags


  devise_for :users, :path => 'sessions'
  devise_scope :user do
    get '/sessions/logout', :to  => 'devise/sessions#destroy'
  end

  match 'pages/contact' => 'pages#contact'
  match 'pages/about' => 'pages#about'
  match 'dashboard' => 'dashboard#index'

  get   '/pictures', :to => 'documents#index', :as => :pictures, :type => "pictures"
  get '/pictures/new' => 'documents#new', :as => :new_picture, :type => "pictures"
  get '/pictures/:id' => 'documents#show', :as => :picture, :type => "pictures"
  get '/pictures/:id/edit' => 'documents#edit', :as => :edit_picture, :type => "pictures"
  post '/pictures' => 'documents#create', :as => :create_picture, :type => "pictures"
  get '/pictures/:id/delete' => 'documents#destroy', :as => :destroy_picture, :type => "pictures"
  put '/pictures/:id' => 'documents#update', :as => :update_picture, :type => "pictures"

  get   '/videos', :to => 'documents#index', :as => :videos, :type => "videos"
  get '/videos/new' => 'documents#new', :as => :new_video, :type => "videos"
  get '/videos/:id' => 'documents#show', :as => :video, :type => "videos"
  get '/videos/:id/edit' => 'documents#edit', :as => :edit_video, :type => "videos"
  post '/videos' => 'documents#create', :as => :create_video, :type => "videos"
  get '/videos/:id/delete' => 'documents#destroy', :as => :destroy_video, :type => "videos"
  put '/videos/:id' => 'documents#update', :as => :update_video, :type => "videos"


  get   '/binaries', :to => 'documents#index', :as => :binaries, :type => "binaries"
  get '/binaries/new' => 'documents#new', :as => :new_binary, :type => "binaries"
  get '/binaries/:id' => 'documents#show', :as => :binary, :type => "binaries"
  get '/binaries/:id/edit' => 'documents#edit', :as => :edit_binary, :type => "binaries"
  post '/binaries' => 'documents#create', :as => :create_binary, :type => "binaries"
  get '/binaries/:id/delete' => 'documents#destroy', :as => :destroy_binary, :type => "binaries"
  put '/binaries/:id' => 'documents#update', :as => :update_binary, :type => "binaries"

  get   '/texts', :to => 'documents#index', :as => :texts, :type => "texts"
  get '/texts/new' => 'documents#new', :as => :new_text, :type => "texts"
  get '/texts/:id' => 'documents#show', :as => :text, :type => "texts"
  get '/texts/:id/edit' => 'documents#edit', :as => :edit_text, :type => "texts"
  post '/texts' => 'documents#create', :as => :create_text, :type => "texts"
  get '/texts/:id/delete' => 'documents#destroy', :as => :destroy_text, :type => "texts"
  put '/texts/:id' => 'documents#update', :as => :update_text, :type => "texts"
  get '/texts/new/type_select' => 'documents#text_choice', :as => :new_text_choice, :type => "texts"

  get   '/sounds', :to => 'documents#index', :as => :sounds, :type => "sounds"
  get '/sounds/new' => 'documents#new', :as => :new_sound, :type => "sounds"
  get '/sounds/:id' => 'documents#show', :as => :sound, :type => "sounds"
  get '/sounds/:id/edit' => 'documents#edit', :as => :edit_sound, :type => "sounds"
  post '/sounds' => 'documents#create', :as => :create_sound, :type => "sounds"
  get '/sounds/:id/delete' => 'documents#destroy', :as => :destroy_sound, :type => "sounds"
  put '/sounds/:id' => 'documents#update', :as => :update_sound, :type => "sounds"

  get '/documents/new/choice' => 'documents#new_document_choice', :as => :new_document_choice

  get '/dashboard/:status' => 'documents#dashboard_index', :as => :dashboard_index

  #namespace :dashboard do
  #  resources :users
  #  match 'users/:id/destroy' => 'users#destroy'
  #  match 'users/:id/update' => 'users#update'
  #  resources :items, :path => 'documents'
  #  match 'published' =>'items#published'
  #  match 'new' => "items#fresh"
  #end

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
  root :to => 'pages#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
