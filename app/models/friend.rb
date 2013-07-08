class Friend < ActiveRecord::Base
  attr_accessible :gender, :likes, :name, :uid
  serialize :likes
end
