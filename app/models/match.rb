class Match < ActiveRecord::Base
  belongs_to :user
  belongs_to :match, class_name: "User"
  attr_accessible :user, :match
end
