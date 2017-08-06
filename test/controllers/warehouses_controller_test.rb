require 'test_helper'

class WarehousesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:liam)
    @other_user = users(:archer)
    @warehouse = warehouses(:warehouse_one)
  end

  test "should get warehouses" do
    get warehouses_path
    assert_response :success
  end

  test "should get new" do
    log_in_as(@user)
    get warehouses_new_url
    assert_response :success
  end

  test "should redirect new warehouses when not logged in as admin" do
    log_in_as(@other_user)
    get warehouses_new_url
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect edit when not logged in as admin" do
    log_in_as(@other_user)
    get edit_warehouse_path(@warehouse)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect destroy when not logged in" do
    log_in_as(@other_user)
    assert_no_difference 'Warehouse.count' do
      delete warehouse_path(@warehouse)
    end
    assert_redirected_to root_url
  end
end