class AddLastLoginToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :last_login, :datetime
    User.update_all ["last_login = updated_at",]
  end

  def self.down
    remove_column :users, :last_login
  end
end
