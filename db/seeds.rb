# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Coupon.delete_all
# . . .
Coupon.create(Brand_name: 'Heinz',
              Brand_image: 'Heinz.png',
              Offer_desc: '50c off Heinz Ketchup 500g',
              Saving_amount: '0.50c',
              Coupon_image: 'Heinz_coupon',
              Start_date: '25/11/2012',
              Expiry_date: '25/01/2013',
              redemption_details: 'Heinz, address details',
              Client_details:
                  %{Heinz will redeem this coupon to the value of .50c
                      once accepted as part payment for Heinz Ketchup 500g only.
                      This offer is only valid for the specified dates.
                      One coupon per customer. Valid in black and white or colour.
                      It must not be used for any other product or promotion.
                      Limited to one coupon per purchase.
                      Coupons cannot be redeemed for cash or in conjuction with any other offer.
                      Terms & conditions apply.},
              Barcode_no: '502506619416',)

Coupon.create(Brand_name: 'Bachelors',
              Brand_image: 'bachelors.png',
              Offer_desc: '50c off Bachelors Beans 250g',
              Saving_amount: '0.50c',
              Coupon_image: 'Bachelors_coupon',
              Start_date: '25/01/2012',
              Expiry_date: '25/02/2013',
              redemption_details: 'Bachelors, address details',
              Client_details:
                  %{<p>Get .50c off Bachelors. This offer is only valid for the specified dates.
                      One coupon per customer.  Terms & conditions apply. </p>},
              Barcode_no: '502506619528',)
# . . .