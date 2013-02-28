class ChangeColumnTypeInUsers < ActiveRecord::Migration
  def up
    change_column :users, :user_type, :string
  end

  def down
    change_column :users, :user_type, :string
  end
end
