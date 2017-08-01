require 'test_helper'

class ProductCreationTest < ActionDispatch::IntegrationTest
  test "invalid product information" do
    get products_new_url
    assert_no_difference 'Product.count' do
      post products_path, params: { product: { name:  " ",
                                         description: " ",
                                         warehouse:   " "} }
    end
    assert_template 'products/new'
  end

  test "valid product information" do
    get products_new_path
    assert_difference 'Product.count', 1 do
      post products_path, params: { product: { name:  "Example product",
                                         description: "Example description",
                                         warehouse:   "Example warehouse" } }
    end
    follow_redirect!
    assert_template 'products/show'
  end
end
