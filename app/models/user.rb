class User < ActiveRecord::Base
  has_many :authorizations, dependent: :destroy
  
  has_many :acceptances,  dependent: :destroy
  has_many :accepted_ppl, through: :acceptances, source: :accepted

  has_many :rejections, dependent: :destroy
  has_many :rejected_ppl, through: :rejections, source: :rejected
  
  has_many :friendships,  dependent: :destroy
  has_many :friends, through: :friendships
  
  has_many :exclusions,  dependent: :destroy
  has_many :excluded_ppl, through: :exclusions, source: :excluded

  has_many :matches, dependent: :destroy
  has_many :matched_ppl, through: :matches, source: :match

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
    unless user = find_by_uid(hash['uid'])
      user = create
      user.name = hash['info']['name']
      user.uid = hash['uid']
      user.save
    end
    user
  end

  def check_or_add_to_friends
    if !Friend.find_by_uid(uid)
      Friend.create(name: name, gender: gender, uid: uid, likes: user_info.likes.map { |a| a })
    end
  end


  def fb_token
    authorizations.find_by_provider("facebook").access_token
  end

  def store_facebook_info
    self.first_name = user_info.first_name
    self.last_name = user_info.last_name 
    self.gender = user_info.gender
    self.birthday = user_info.birthday.to_datetime
    begin
      self.hometown = user_info.hometown.name
    rescue
    end
    self.email = user_info.email
    self.uid = user_info.identifier
    user_info.education.each do |edu|
      begin
        self.school = edu.school.name
      rescue
      end
    end
      
    if !self.friends_updated || self.friends_updated < 1.week.ago
      #update_friends_list
      self.friends_updated = Time.now
    end 

    self.save
    check_or_add_to_friends
  end

  def update_friends_list
    new_list = user_info.friends
    old_list = self.friends
    new_list.each do |guy|
      guy = guy.fetch
      if !old_list.include?(guy.identifier)
        friendships.create!(friend_id: guy.identifier)
        if !Friend.find_by_uid(guy.identifier)
          #Friend.create(name: guy.name, gender: guy.gender, uid: guy.identifier, likes: guy.likes.map { |a| a })
        end
      end
    end
  end

  
end
