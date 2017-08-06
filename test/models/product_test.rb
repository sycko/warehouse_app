require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = Product.new(name: "Example", description: "Description", 
    						warehouses_id: "warehouses")
  end

  test "should be valid" do
    assert @product.valid?
  end

  test "name should be present" do
    @product.name = "     "
    assert_not @product.valid?
  end

  test "description should be present" do
    @product.description = "     "
    assert_not @product.valid?
  end

  test "warehouse should be present" do
  	@product.warehouses_id = ""
  	assert_not @product.valid?
  end

  test "name should not be too long" do
    @product.name = "a" * 101
    assert_not @product.valid?
  end

  test "description should not be too long" do
    @product.description = "a" * 501
    assert_not @product.valid?
  end

  test "products should be unique" do
    duplicate_product = @product.dup
    @product.save
    assert_not duplicate_product.valid?
  end
end
