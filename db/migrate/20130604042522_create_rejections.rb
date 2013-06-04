class CreateRejections < ActiveRecord::Migration
  def change
    create_table :rejections do |t|
      t.string :user
      t.string :rejected

      t.timestamps
    end
  end
end
