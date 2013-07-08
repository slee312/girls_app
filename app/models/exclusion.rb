class Exclusion < ActiveRecord::Base
  belongs_to :user
  belongs_to :excluded, class_name: "User"
  attr_accessible :excluded_id, :user_id
end
