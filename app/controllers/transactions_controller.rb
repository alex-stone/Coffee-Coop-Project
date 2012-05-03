class TransactionsController < ApplicationController
  
  # Display Table of Transactions
  # To Do: Set up Sorting Functionality
  def index
    options = Hash.new
    if(params[:id]) 
      options[:order] = params[:id]
    end
    session[:params] = params
    conditions = Hash.new
    if(params[:center_id])
      @center = Center.find_by_id(params[:center_id])
      unless @center.nil?
        conditions[:center] = @center.name
      end
    end
    if(params[:producer_id])
      @producer = User.find_by_id(params[:producer_id])
      unless @producer.nil?
        conditions[:producer] = @producer.name
      end
    end


    # If there is a :cooperative_id, center_id, or producer_id then filter
    # the possible options based on that.

    @transactions = Transaction.find(:all,options, :conditions => conditions)
    @can_edit = user_is_admin?  # In case we want to set up so certain non-admins can edit

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transactions }
    end
  end

  # Display Details for a Transaction
  # To Do: Set up editing, if clerk owns it or if admin
  def show
    @transaction = Transaction.find(params[:id])
    @can_edit = user_is_admin? 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transaction }
    end
  end

  # New Transaction
  # To Do: Restrict lists of producers by Cooperative
  # Maybe instead of New Transaction button, have drop down for New Transaction for a specific Cooperative
  def new
    @transaction = Transaction.new
    @producers = User.find_all_by_role('producer')
    @centers = Transaction.get_centers
    @delivery_forms = Transaction.get_delivery_forms

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
    @producers = User.find_all_by_role('producer')
    @centers = Transaction.get_centers
    @delivery_forms = Transaction.get_delivery_forms
    @can_destroy = user_is_admin?

  end

  # POST /transactions
  # POST /transactions.json
  def create
    # Method to add Producer to hash to create transaction
    user = User.find_by_id(params[:transaction][:producer])
    hash = Hash.new
    hash = params[:transaction]
    if user.nil?
      respond_to do |format|
        format.html { render action: "new" }
        format.json { head :no_content, status: :unprocessable_entity }
      end
    else
      hash[:producer] = user.name
      @transaction = user.transactions.build(hash)
      @transaction.save!
      user.save!
    
    
      respond_to do |format|
        if @transaction.save
          format.html { redirect_to @transaction, notice: t(:transaction_created) }
          format.json { render json: @transaction, status: :created, location: @transaction }
        else
          format.html { render action: "new" }
          format.json { render json: @transaction.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.json
  def update
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        format.html { redirect_to @transaction, notice: t(:transaction_updated) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end
end
