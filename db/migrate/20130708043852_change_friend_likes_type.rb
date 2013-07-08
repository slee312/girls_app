class ChangeFriendLikesType < ActiveRecord::Migration
  def change
    change_column :friends, :likes, :text, limit: 4294967295
  end
end
