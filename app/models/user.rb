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

  def store_facebook_info
    self.first_name = user_info.first_name
    self.last_name = user_info.last_name 
    self.gender = user_info.gender
    self.birthday = user_info.birthday.to_datetime
    self.hometown = user_info.hometown.name
    self.email = user_info.email
    self.uid = user_info.identifier
    self.hometown = user_info.hometown.name
    user_info.education.each do |edu|
      self.school = edu.school.name
    end
      
    #add more attriutes later
    self.save
  end
  
end
