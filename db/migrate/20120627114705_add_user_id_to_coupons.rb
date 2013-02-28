class AddUserIdToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :user_id, :string, :precision => 8
  end
end
