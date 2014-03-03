Storerating::Application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'

  resources :events

  devise_for :admins

  resources  :massmails
  resources  :reviews

  resources :forums do
    resources :comments
  end 

   get "dashboard/index"
   match 'follow' => 'dashboard#follow'
   match 'unfollow' => 'dashboard#unfollow'
   match 'business/:id' => 'dashboard#show'
# 
  # get "plans/show"
# 
  # get "plans/edit"
# 
  # get "plans/new"
# 
  # get "plans/destroy"
# 
  # get "plans/create"

  resources :accounts
  get '/plan' => "accounts#plan"
  get 'paypal/checkout', to: 'accounts#paypal_checkout'
  resources :plans
  
  # resources :accounts, :new => { :express => :post }
  
  devise_for :users,:controllers => {:registrations => "registrations"}
  get '/dashboard' => "home#dashboard"
  get '/ratings' => "home#ratings"
  get '/business' => "home#business"
  get '/plans' => "home#plans"

  resources :dashboard do
    collection do 
      post :post_review
    end
  end 

  resources  :reviews do
    collection do 
      post :post_reply
    end
  end 


 namespace :admin do 
    match '/dashboard' => "dashboard#index"
    resources :events
    resources :massmails
    resources :rating_flags
    resources :reviews
  end

  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
   match ':controller(/:action(/:id))(.:format)'
end
