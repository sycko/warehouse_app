require 'test_helper'

class WarehousesCreationTest < ActionDispatch::IntegrationTest

  def setup
    @warehouse = warehouses(:warehouse_one)
    @user = users(:liam)
  end
  
  test "invalid warehouse information" do
  	log_in_as(@user)
    get warehouses_new_url
    assert_no_difference 'Warehouse.count' do
      post warehouses_path, params: { warehouse: { name:  " ",
                                         street: " ",
                                         city: " ",
                                         state: " ",
                                         zip: " ",
                                         phone: " "} }
    end
    assert_template 'warehouses/new'
  end

  test "valid warehouse information" do
  	log_in_as(@user)
    get warehouses_new_path
    assert_difference 'Warehouse.count', 1 do
      post warehouses_path, params: { warehouse: { name:  "Example",
                                         street: "Example",
                                         city: "Example",
                                         state: "Example",
                                         zip: "Example",
                                         phone: "Example"} }
    end
    follow_redirect!
    assert_template 'warehouses/show'
  end
end
