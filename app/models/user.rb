class User < ActiveRecord::Base
  has_many :authorizations
  attr_accessible #none


  def user_info 
=begin GET method
    require 'net/http'

    uri = URI.parse("https://graph.facebook.com/me?access_token=#{authorizations.first.access_token}&fields=picture")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    
    require 'json'

    hash = JSON.parse response.body
    hash['picture']['data']['url']
=end

      @user_info ||= FbGraph::User.new('me', access_token:fb_token).fetch
  end

  def self.find_or_create_from_hash!(hash)
    unless user = find_by_name(hash['info']['name'])
      user = create
      user.name = hash['info']['name']
      user.save
    end
    user
  end

  def fb_token
    authorizations.find_by_provider("facebook").access_token
  end
  
end
