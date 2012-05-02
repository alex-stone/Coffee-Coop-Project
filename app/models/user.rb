class User < ActiveRecord::Base
  has_many :sessions, :dependent => :destroy
  has_many :transactions
  has_one :cooperative
  has_one :center

  attr_accessible :name, :email
 
  def self.find_from_hash(hash)
    find_by_name_and_email(hash['name'], hash['email'])
  end

  def self.create_from_hash(hash)
    create!(:name => hash['name'], :email => hash['email'])
  end

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
