class AddIDtoExtensions < ActiveRecord::Migration
  def change
    rename_column :friendships, :friend, :friend_id
    rename_column :acceptances, :accepted, :accepted_id
    rename_column :rejections, :rejected, :rejected_id
    rename_column :exclusions, :excluded, :excluded_id
  end
end
