class AddAccessTokenToAuthorization < ActiveRecord::Migration
  def change
    add_column :authorizations, :access_token, :string
  end
end
