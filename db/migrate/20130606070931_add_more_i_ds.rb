class AddMoreIDs < ActiveRecord::Migration
  def change
    rename_column :acceptances, :user, :user_id
    rename_column :rejections, :user, :user_id
    rename_column :exclusions, :user, :user_id
  end
end
