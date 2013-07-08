class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :uid
      t.string :name
      t.string :gender
      t.string :likes

      t.timestamps
    end
  end
end
