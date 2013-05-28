class ChangeExpiryDateToDatetime < ActiveRecord::Migration
  def change 
    change_column :authorizations, :token_expiry_date,  :datetime
  end
end
