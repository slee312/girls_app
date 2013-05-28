class AddTokenExpiryToAuthorizations < ActiveRecord::Migration
  def change
    add_column :authorizations, :token_expiry_date, :string
  end
end
