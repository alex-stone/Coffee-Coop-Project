class ProducersController < ApplicationController
  def index 
    @is_admin = user_is_admin?
    if params[:center_id]
      @has_center = true
      @center = Center.find_by_id(params[:center_id])
      @producers = User.find(:all, :conditions => {:role => 'producer', :center => @center.name})
    else
      @has_center = false
      @producers = User.find_all_by_role('producer')
    end

  end 
end
