CoffeeCoopProject::Application.routes.draw do
  resources :users

    
  resources :centers do
    resources :producers do
      resources :transactions
    end
    resources :transactions
  end
  resources :producers do
    resources :transactions
  end
  resources :transactions

  #rack-offline path
 # match "/application.manifest" => Rails::Offline
  
  # Set up Omniauth paths
  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'
  
  match '/signin' => 'sessions#signin'
  match '/signout' => 'sessions#signout'
  

  
  scope "/:locale" do
    resources :transactions
    resources :users
  end

  resources :sessions, :only => [:index, :create, :destroy] do
    collection do
      get 'signin'
      get 'signout'
      get 'failure'
    end
  end
  

  
  match '/:locale' => 'users#index'
  
  match '/' => 'users#index'
  root :to => 'users#index'

end
