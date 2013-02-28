class AddBrandImageSizeToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :Brand_image_size, :integer
  end
end
