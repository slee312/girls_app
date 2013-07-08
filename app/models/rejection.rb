class Rejection < ActiveRecord::Base
  belongs_to :user
  belongs_to :rejected, class_name: "User"
  attr_accessible :rejected_id, :user_id
end
