class Center < ActiveRecord::Base
  has_one :cooperative
  has_many :transactions
end
