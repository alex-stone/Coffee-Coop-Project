class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  before_filter :authenticate_admin!, :only => [:new, :create]

  def index
    @users = User.all
    @is_admin = user_is_admin?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
    @is_admin = user_is_admin?
    @can_edit = can_edit?

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new
    @roles = User.get_roles
    @is_admin = user_is_admin?

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def edit
    @user = User.find(params[:id])
    @roles = User.get_roles
    unless can_edit?
      flash[:notice] = t(:error_edit_permissions)
      redirect_to users_path
    end
    @is_admin = user_is_admin?

  end

  # POST /users
  # POST /users.json
  def create
    hash = {:name => params[:user][:name], :email => params[:user][:email]}
    @user = User.new(hash)
    if user_is_admin?
      @user.role = params[:user][:role]
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: t(:user_created) }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if current_user.is_admin? 
      new_role = params[:user][:role]
      @user.role = new_role
      @user.save!
    end
    
    hash = {:name => params[:user][:name], :email => params[:user][:email]}

    respond_to do |format|
      if @user.update_attributes(hash)
        format.html { redirect_to @user, notice: t(:user_updated) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  private
    def can_edit?
      unless current_user.nil?
        return current_user.is_admin? || current_user == @user
      end
      return false
    end
end
