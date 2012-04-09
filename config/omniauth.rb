require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  #Providers with id/secret
  provider :facebook, 'APP_ID', 'APP_SECRET'
  provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'

  # Generic Openid
  provider :open_id, :store => OpenID::Store::Filesystem.new('./tmp'), :name => 'openid'

  # Dedicated Openid
  provider :open_id, :store => OpenID::Store::Filesystem.new('./tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
  
  provider :open_id, :store => OpenID::Store::Filesystem.new('./tmp'), :name => 'yahoo', :identifier => 'yahoo.com'
  provider :open_id, :store => OpenID::Store::Filesystem.new('./tmp'), :name => 'aol', :identifier => 'openid.aol.com'
  provider :open_id, :store => OpenID::Store::Filesystem.new('./tmp'), :name => 'myopenid', :identifier => 'myopenid.com'
end
