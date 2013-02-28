class AddRedemptionDetailsToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :redemption_details, :string
  end
end
