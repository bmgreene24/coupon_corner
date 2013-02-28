class LineItem < ActiveRecord::Base

    belongs_to :coupon


  def total_price
    coupon.price * quantity
  end
end
