class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, primary_key: :uid
  attr_accessible :friend_id, :user_id
end
