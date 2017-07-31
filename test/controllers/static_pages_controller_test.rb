require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get warehouses" do
    get static_pages_warehouses_url
    assert_response :success
  end

  test "should get products" do
    get static_pages_products_url
    assert_response :success
  end

end
