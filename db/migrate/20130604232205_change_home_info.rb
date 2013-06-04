class ChangeHomeInfo < ActiveRecord::Migration
  def change
    rename_column :users, :country, :hometown
    remove_column :users, :city
  end
end
