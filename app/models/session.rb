class Session < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  attr_accessible :provider, :uid, :uname, :uemail, :user_id

  def self.find_from_hash(hash)
    find_by_provider_and_uid(hash['provider'], hash['uid'])
  end

  def self.create_from_hash(hash, user=nil)
    user ||= User.create_from_hash(hash)
    Session.create(:user_id => user.id, :uid => hash['uid'], :provider => hash['provider'])
  end
end
