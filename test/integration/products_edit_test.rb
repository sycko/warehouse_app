require 'test_helper'

class ProductsEditTest < ActionDispatch::IntegrationTest

  def setup
    @product = products(:product_one)
    @user = users(:liam)
  end

  test "unsuccessful edit" do
  	log_in_as @user
    get edit_product_path(@product)
    assert_template 'products/edit'
    patch product_path(@product), params: { product: { name: "     ",
                                              description: "     ",
                                              warehouse: "     "} }

    assert_template 'products/edit'
  end

  test "successful edit" do
  	log_in_as @user
    get edit_product_path(@product)
    assert_template 'products/edit'
    name  = "Example"
    description = "Example"
    warehouse = "Example"
    patch product_path(@product), params: { product: { name: "Example",
                                              description: "Example",
                                              warehouse: "Example"} }
    assert_not flash.empty?
    assert_redirected_to @product
    @product.reload
    assert_equal name,  @product.name
    assert_equal description, @product.description
    assert_equal warehouse, @product.warehouse
  end
end
