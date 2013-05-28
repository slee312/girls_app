class Authorization < ActiveRecord::Base
  belongs_to :user
  attr_accessible #none
  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.update_or_create_from_hash(hash)
    if old_entry = find_by_provider_and_uid(hash['provider'], hash['uid'])
      old_entry.access_token = hash['credentials']['token']
      old_entry.token_expiry_date = Time.at(hash['credentials']['expires_at'])
      old_entry.save
      old_entry
    else
      create_from_hash(hash)
    end
  end
  
  
  def self.find_from_hash(hash)
    find_by_provider_and_uid(hash['provider'], hash['uid'])
  end

  def self.create_from_hash(hash)
    user ||= User.find_or_create_from_hash!(hash)
    temp_author = Authorization.create
    temp_author.user = user
    temp_author.uid = hash['uid']
    temp_author.provider = hash['provider']
    temp_author.access_token = hash['credentials']['token']
    temp_author.token_expiry_date = Time.at(hash['credentials']['expires_at'])
    temp_author.save
    temp_author
  end

end
