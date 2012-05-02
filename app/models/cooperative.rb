class Cooperative < ActiveRecord::Base
  has_many :centers
  has_many :users
  has_many :transactions


  
end
