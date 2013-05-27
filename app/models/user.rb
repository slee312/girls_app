class User < ActiveRecord::Base
  has_many :authorizations
  attr_accessible :name

  def self.create_from_hash!(hash)
    unless user = find_by_name(hash['info']['name'])
      user = create(name: hash['info']['name'])
    end
    user
  end
end
