class Center < ActiveRecord::Base
  has_many :users
  has_many :transactions

  attr_accessible :name
  
end
