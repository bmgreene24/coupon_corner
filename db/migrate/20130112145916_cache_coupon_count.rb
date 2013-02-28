class CacheCouponCount < ActiveRecord::Migration
  def up
    execute "update categories set coupons_count=(select count(*) from coupons where category_id=categories.id)"
  end

  def down
  end
end
