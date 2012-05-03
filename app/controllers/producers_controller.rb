class ProducersController < ApplicationController
  def index 
    @producers = User.find_all_by_role('producer')
    @is_admin = user_is_admin?
    if params[:center_id]
      @has_center = true
      @center = Center.find_by_id(params[:center_id])
    else
      @has_center = false
    end

  end 
end
