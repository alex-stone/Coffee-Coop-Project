CoffeeCoopProject::Application.routes.draw do
  resources :transactions
  resources :users

  # Set up Omniauth paths
  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'
  
  match '/signin' => 'sessions#signin'
  match '/signout' => 'sessions#signout'

  resources :sessions, :only => [:index, :create, :destroy] do
    collection do
      get 'signin'
      get 'signout'
      get 'failure'
    end
  end

  root :to => 'users#index'

end
