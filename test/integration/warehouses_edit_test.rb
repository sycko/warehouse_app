require 'test_helper'

class WarehousesEditTest < ActionDispatch::IntegrationTest

  def setup
    @warehouse = warehouses(:warehouse_one)
    @user = users(:liam)
  end

  test "unsuccessful edit" do
  	log_in_as @user
    get edit_warehouse_path(@warehouse)
    assert_template 'warehouses/edit'
    patch warehouse_path(@warehouse), params: { warehouse: { name:  " ",
                                         street: " ",
                                         city: " ",
                                         state: " ",
                                         zip: " ",
                                         phone: " "} }

    assert_template 'warehouses/edit'
  end

  test "successful edit" do
  	log_in_as @user
    get edit_warehouse_path(@warehouse)
    assert_template 'warehouses/edit'
    name  = "Example"
    street = "Example"
    city = "Example"
    state = "Examplee"
    zip = "Example"
    phone = "Example"
    patch warehouse_path(@warehouse), params: { warehouse: { name:  name,
                                         street: street,
                                         city: city,
                                         state: state,
                                         zip: zip,
                                         phone: phone} }
    assert_not flash.empty?
    assert_redirected_to @warehouse
    @warehouse.reload
    assert_equal name,  @warehouse.name
    assert_equal street, @warehouse.street
    assert_equal city, @warehouse.city
    assert_equal state, @warehouse.state
    assert_equal zip, @warehouse.zip
    assert_equal phone, @warehouse.phone
  end
end
