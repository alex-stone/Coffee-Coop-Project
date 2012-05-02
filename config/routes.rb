CoffeeCoopProject::Application.routes.draw do
  resources :transactions
  resources :users

  #rack-offline path
  offline = Rack::Offline.configure do
    
    Dir["#{Rails.root}/app/assets/javascripts/*"].each do |file|
      app = Pathname.new("#{Rails.root}/app/assets")
      cache Pathname.new(file).relative_path_from(app)
    end
    
    Dir["#{Rails.root}/app/assets/stylesheets/*"].each do |file|
      app = Pathname.new("#{Rails.root}/app/assets")
      cache Pathname.new(file).relative_path_from(app)
    end
    
    Dir["#{Rails.root}/app/assets/images/*"].each do |file|
      app = Pathname.new("#{Rails.root}/app/assets")
      cache Pathname.new(file).relative_path_from(app)
    end
    
    files = Dir["#{Rails.root}/**/*.html"]
    files.each do |file|
      public_dir = Pathname.new("#{Rails.root}/public")
      cache Pathname.new(file).relative_path_from(public_dir)
    end
  
    network "/"
  end

  match "/application.manifest" => offline 
 
  
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
