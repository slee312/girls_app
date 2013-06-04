class CreateAcceptances < ActiveRecord::Migration
  def change
    create_table :acceptances do |t|
      t.string :user
      t.string :accepted

      t.timestamps
    end
  end
end
