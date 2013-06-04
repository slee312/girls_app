class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :user1
      t.string :user2

      t.timestamps
    end
  end
end
