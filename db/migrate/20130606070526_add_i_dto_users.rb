class AddIDtoUsers < ActiveRecord::Migration
  def change
    rename_column :friendships, :user, :user_id
  end
end
