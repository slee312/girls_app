class AddFriendsLastUpdate < ActiveRecord::Migration
  def change
    add_column :users, :friends_updated, :datetime
  end
end
