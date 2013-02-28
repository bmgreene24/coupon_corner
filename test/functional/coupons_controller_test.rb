require 'test_helper'

class CouponsControllerTest < ActionController::TestCase
  setup do
    @coupon = coupons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coupons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coupon" do
    assert_difference('Coupon.count') do
      post :create, coupon: { Barcode_no: @coupon.Barcode_no, Brand_image: @coupon.Brand_image, Brand_name: @coupon.Brand_name, Category: @coupon.Category, Client_details: @coupon.Client_details, Coupon_image: @coupon.Coupon_image, Expiry_date: @coupon.Expiry_date, Offer_desc: @coupon.Offer_desc, Saving_amount: @coupon.Saving_amount, Start_date: @coupon.Start_date }
    end

    assert_redirected_to coupon_path(assigns(:coupon))
  end

  test "should show coupon" do
    get :show, id: @coupon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coupon
    assert_response :success
  end

  test "should update coupon" do
    put :update, id: @coupon, coupon: { Barcode_no: @coupon.Barcode_no, Brand_image: @coupon.Brand_image, Brand_name: @coupon.Brand_name, Category: @coupon.Category, Client_details: @coupon.Client_details, Coupon_image: @coupon.Coupon_image, Expiry_date: @coupon.Expiry_date, Offer_desc: @coupon.Offer_desc, Saving_amount: @coupon.Saving_amount, Start_date: @coupon.Start_date }
    assert_redirected_to coupon_path(assigns(:coupon))
  end

  test "should destroy coupon" do
    assert_difference('Coupon.count', -1) do
      delete :destroy, id: @coupon
    end

    assert_redirected_to coupons_path
  end
end
