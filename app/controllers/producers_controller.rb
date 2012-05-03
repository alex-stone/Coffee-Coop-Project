class ProducersController < ApplicationController
  def index 
    @producers = User.find_all_by_role('producer')
    @is_admin = user_is_admin?
  end 
end
