class CreateExclusions < ActiveRecord::Migration
  def change
    create_table :exclusions do |t|
      t.string :user
      t.string :excluded

      t.timestamps
    end
  end
end
