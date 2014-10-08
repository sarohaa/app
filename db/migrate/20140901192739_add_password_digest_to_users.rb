class AddPasswordDigestToUsers < ActiveRecord::Migration
  def up
  	remove_column "users","encrypted_password"
  	add_column "users","password_digest", :string
  end
  def down

  end
end
