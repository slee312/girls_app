class Acceptance < ActiveRecord::Base
  belongs_to :user
  belongs_to :accepted, class_name: "User"
  attr_accessible :accepted_id, :user_id
end
