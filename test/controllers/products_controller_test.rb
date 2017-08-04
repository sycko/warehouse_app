require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:liam)
    @product = products(:product_one)
  end

  test "should get products" do
  	get products_path
  	assert_response :success
  end

  test "should get new" do
  	log_in_as(@user)
    get products_new_url
    assert_response :success
  end

  test "should redirect products when not logged in" do
    get  products_new_url
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when not logged in" do
    get edit_product_path(@product)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

 test "should redirect destroy when not logged in" do
    assert_no_difference 'Product.count' do
      delete product_path(@product)
    end
    assert_redirected_to login_url
  end
end
