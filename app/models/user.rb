class User < ActiveRecord::Base
  has_many :sessions, :dependent => :destroy
  has_many :transactions

  attr_accessible :name, :email
  
  def is_admin?
    x = []
    x << self.role
    (x & ROLES)[0] == ROLES[0]
  end

  def self.get_roles
    return ROLES
  end

  private
    ROLES = %w{admin clerk producer guest}

end
