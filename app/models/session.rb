class Session < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  attr_accessible :provider, :uid, :uname, :uemail, :user_id

  def self.find_from_hash(hash)
    find_by_provider_and_uid(hash['provider'], hash['uid'])
  end

  def self.create_authhash(hash, service)
    new_hash = Hash.new
  
    if service == 'facebook'
      hash['extra']['user_hash']['email'] ? new_hash[:email] =  hash['extra']['user_hash']['email'] : new_hash[:email] = ''
      hash['extra']['user_hash']['name'] ? new_hash[:name] =  hash['extra']['user_hash']['name'] : new_hash[:name] = ''
      hash['extra']['user_hash']['id'] ?  new_hash[:uid] =  hash['extra']['user_hash']['id'].to_s : new_hash[:uid] = ''
      hash['provider'] ? new_hash[:provider] = hash['provider'] : new_hash[:provider] = ''
    elsif service == 'github'
      hash['info']['email'] ? new_hash[:email] =  hash['info']['email'] : new_hash[:email] = ''
      hash['info']['name'] ? new_hash[:name] =  hash['info']['name'] : new_hash[:name] = ''
      hash['extra']['user_hash']['id'] ? new_hash[:uid] =  hash['extra']['user_hash']['id'].to_s : new_hash[:uid] = ''
      hash['provider'] ? new_hash[:provider] =  hash['provider'] : new_hash[:provider] = ''  
    elsif ['google', 'yahoo', 'twitter', 'myopenid', 'open_id'].index(service_route) != nil
      hash['info']['email'] ? new_hash[:email] =  hash['info']['email'] : new_hash[:email] = ''
      hash['info']['name'] ? new_hash[:name] =  hash['info']['name'] : new_hash[:name] = ''
      hash['uid'] ? new_hash[:uid] = hash['uid'].to_s : new_hash[:uid] = ''
      hash['provider'] ? new_hash[:provider] = hash['provider'] : new_hash[:provider] = ''
    else
      return nil
    end
    return new_hash
  end

end
