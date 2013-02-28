class AddBrandImageContentTypeToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :Brand_image_content_type, :string
  end
end
