class ChangeFriendsLkesSizeAgain < ActiveRecord::Migration
  def change
    change_column :friends, :likes, :text, limit: 16777215
  end
end
