require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Warehouse App"
  end
  
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get warehouses" do
    get warehouses_path
    assert_response :success
    assert_select "title", "Warehouses | #{@base_title}"
  end

  test "should get products" do
    get products_path
    assert_response :success
    assert_select "title", "Products | #{@base_title}"
  end

end
