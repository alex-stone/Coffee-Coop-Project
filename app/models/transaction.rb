class Transaction < ActiveRecord::Base
  belongs_to :user

  attr_accessible :producer, :code, :center, :date, :lot_number, :sack_number, :gross_weight, :tare, :net_weight, :comments, :delivery_form, :price, :quality, :classes, :s_f, :bitten, :bare, :green, :drill, :mold, :gqmd, :total, :received_by, :user_id

  def self.get_centers
    ['COMPROCOOM', 'San Jose de los Auctions', 'Rancho Grande', 'Wibuse', 'The Chocolata']
  end
  
  def self.get_delivery_forms
    ['Delivery', 'Purchase']
  end

end
