class AddCouponsCountToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :coupons_count, :integer, default:0, null:false
  end
end
