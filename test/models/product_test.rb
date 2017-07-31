require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = Product.new(name: "Example Product", description: "Example description", 
    						warehouse: "Example Warehouse")
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
    duplicate_product.name = @product.name.upcase
    @product.save
    assert_not duplicate_product.valid?
  end
end