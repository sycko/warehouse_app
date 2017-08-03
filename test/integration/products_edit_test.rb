require 'test_helper'

class ProductsEditTest < ActionDispatch::IntegrationTest
  def setup
    @product = products(:product_one)
  end

  test "unsuccessful edit" do
    get edit_product_path(@product)
    assert_template 'products/edit'
    patch product_path(@product), params: { product: { name:  " ",
                                              description: " ",
                                              warehouse:              " "} }

    assert_template 'products/edit'
  end
end
