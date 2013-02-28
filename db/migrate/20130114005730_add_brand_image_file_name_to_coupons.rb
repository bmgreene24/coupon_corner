class AddBrandImageFileNameToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :Brand_image_file_name, :string
  end
end
