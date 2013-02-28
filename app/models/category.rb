class Category < ActiveRecord::Base

  has_many :coupons
  attr_accessible :name
end
