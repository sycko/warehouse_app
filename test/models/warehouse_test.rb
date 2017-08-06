require 'test_helper'

class WarehouseTest < ActiveSupport::TestCase
  def setup
    @warehouse = Warehouse.new(name: "Example", street: "Street", 
    						city: "City", state: "State", zip: "12345", phone: "123456789")
  end

  test "should be valid" do
    assert @warehouse.valid?
  end

  test "name should be present" do
    @warehouse.name = "     "
    assert_not @warehouse.valid?
  end

  test "street should be present" do
    @warehouse.street = "     "
    assert_not @warehouse.valid?
  end

  test "city should be present" do
    @warehouse.city = "     "
    assert_not @warehouse.valid?
  end

  test "state should be present" do
    @warehouse.state = "     "
    assert_not @warehouse.valid?
  end

  test "zip should be present" do
    @warehouse.zip = "     "
    assert_not @warehouse.valid?
  end

  test "phone should be present" do
    @warehouse.phone = "     "
    assert_not @warehouse.valid?
  end

  test "name should not be too long" do
    @warehouse.name = "a" * 501
    assert_not @warehouse.valid?
  end

  test "warehouse name should be unique" do
    duplicate_warehouse = @warehouse.dup
    @warehouse.save
    assert_not duplicate_warehouse.valid?
  end
end
