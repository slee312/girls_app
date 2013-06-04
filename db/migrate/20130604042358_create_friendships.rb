class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.string :user
      t.string :friend

      t.timestamps
    end
  end
end
