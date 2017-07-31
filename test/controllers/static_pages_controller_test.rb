require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Warehouse App"
  end
  
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get warehouses" do
    get static_pages_warehouses_url
    assert_response :success
    assert_select "title", "Warehouses | #{@base_title}"
  end

  test "should get products" do
    get static_pages_products_url
    assert_response :success
    assert_select "title", "Products | #{@base_title}"
  end

end
