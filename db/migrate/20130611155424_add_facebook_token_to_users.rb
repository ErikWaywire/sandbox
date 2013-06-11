class AddFacebookTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_token, :string
    add_column :users, :facebook_token_expires_at, :datetime
  end
end
