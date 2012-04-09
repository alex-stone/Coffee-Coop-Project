class SessionsController < ApplicationController
  before_filter :authenticate_user!, :except => [:create, :signin, :failure]
  protect_from_forgery :except => :create
  
  # Get all authentication services assigned to the current user
  def index
    @services = current_user.services.order('provider asc')
  end

  # Callback: Success
  # Handles signin in and adding authentication services to current accounts
  # Renders a separate view if there is a new user to create
  def create
    # The full hash from omniauth
    omniauth = request.env['omniauth.auth']
    params[:service] ? service_route = params[:service] : service_route = 'No service recognized (invalid callback)'

    # Checks for existence of hash
    if !(omniauth and params[:service])
      flash[:error] = 'Error while authenticating via ' + service_route.capitalize + '. The service did not return valid data.'
      redirect_to signin_path
    end
    
    @authhash = Session.create_authhash(omniauth, service_route)
    
    if @authhash.nil?
      flash[:error] = 'Service not recognized'
      redirect_to signin_path
    end

    @sess = Session.find_from_hash(@authhash)
    
    # If logged in, add session provider if id doesn't already exist
    # If not logged in, and session exists, log user in
    # If session does not exist create a new user and session
    if user_signed_in?
      if @sess
        flash[:notice] = "Your account at #{@sess.provider.capitalize} is already connected"
        redirect_to services_path
      else
        flash[:notice] = "Successfully added #{@authhash['provider']} authentication"
        current_user.sessions.create(:provider => @authhash['provider'], :uid => @authhash['uid'])
        redirect_to services_path
      end
    elsif @sess
      flash[:notice] = "Signed in successfully via #{@authhash[:provider].capitalize} + '.'"
      session[:user_id] = @sess.user.id
      session[:service_id] = @sess.id
    else
      # Check for old user, logging in with new service
      @olduser = User.find_from_hash(@authhash)
      
      if !@olduser.nil?
        @olduser.sessions.build(:provider => @authhash[:provider], :uid => @authhash[:uid], :uname => @authhash[:uname], :uemail => @authhash[:email])
        @user = @olduser
        user_existed = true
      else
        @newuser ||= User.create_from_hash(@authhash)
        @newuser.sessions.build(:provider => @authhash[:provider], :uid => @authhash[:uid], :uname => @authhash[:uname], :uemail => @authhash[:email])
        @user = @newuser
        user_existed = false 
      end
      if @user.save!
        # Sign in this existing or new user
        # Add user and service ids to session
        session[:user_id] = @user.id
        session[:service_id] = @user.services[@user.services.index{|elt| elt[:provider] == @authhash[:provider]}][:id]
       
        user_existed ? flash[:notice] = "Your account has been associated with #{@authhash[:provider].capitalize} ." : flash[:notice] = 'Your account has been created and you have been signed in!'
        redirect_to user_path(@user)
      else
        flash[:error] = 'There was an error creating you account'
        redirect_to root_url
      end
    end
    redirect_to root_url
  end

  # Callback: Failure
  def failure
    flash[:error] = 'There was an error at the remote authentication service'
    redirect_to root_url
  end

  def signout
    if current_user
      session[:user_id] = nil
      session[:service_id] = nil
      session.delete :user_id
      session.delete :servie_id
      flash[:notice] = 'You have been signed out'
    end
    redirect_to root_url
  end

  # POST to remove an authentication service
  def destroy
    #remove an authentication service linked to the current user
    @service =current_user.services.find(params[:id])
    
    if session[:service_id] == @service.id
  end

end
