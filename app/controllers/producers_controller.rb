class ProducersController < ApplicationController
  def index 
    @producers = User.find_all_by_role('producer')
    @is_admin = user_is_admin?
<<<<<<< HEAD
    if params[:center_id]
      @has_center = true
      @center = Center.find_by_id(params[:center_id])
    else
      @has_center = false
    end

=======
>>>>>>> 915fb89b87ea5f829ed6192242058ac6bead2dcc
  end 
end
