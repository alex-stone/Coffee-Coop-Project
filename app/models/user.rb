class User < ActiveRecord::Base
  has_many :sessions, :dependent => :destroy
  has_many :transactions

  attr_accessible :name, :email
 
  def self.find_from_hash(hash)
    User.find_by_name_and_email(hash['info']['name'], hash['info']['email'])
  end

  def self.create_from_hash(hash)
    create(:name => hash['info']['name'], :email => hash['info']['email'])
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
