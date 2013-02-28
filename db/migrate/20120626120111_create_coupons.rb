class CreateCoupons < ActiveRecord::Migration
  def self.up
    create_table :coupons do |t|
      t.string :Brand_name
      t.binary :Brand_image
      t.text :Offer_desc
      t.float :Saving_amount
      t.string :Category
      t.string :Coupon_image
      t.date :Start_date
      t.date :Expiry_date
      t.text :Client_details
      t.integer :Barcode_no

      t.timestamps
    end

    add_column :coupons, :Brand_image_file_name, :string # Original filename
    add_column :coupons, :Brand_image_content_type, :string # Mime type
    add_column :coupons, :Brand_image_size, :integer # File size in bytes


    add_column :coupons, :Coupon_image_file_name, :string # Original filename
    add_column :coupons, :Coupon_image_content_type, :string # Mime type
    add_column :coupons, :Coupon_image_size, :integer # File size in bytes


  end

  def self.down
    drop_table :coupons
  end

  remove_column :coupons, :Brand_image_file_name
  remove_column :coupons, :Brand_image_content_type
  remove_column :coupons, :Brand_image_size


  remove_column :coupons, :Coupon_image_file_name
  remove_column :coupons, :Coupon_image_content_type
  remove_column :coupons, :Coupon_image_size

end
