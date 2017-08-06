require 'test_helper'

class ProductCreationTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:liam)
  end
  
  test "invalid product information" do
  	log_in_as(@user)
    get products_new_url
    assert_no_difference 'Product.count' do
      post products_path, params: { product: { name:  " ",
                                         description: " ",
                                         warehouses_id:   " "} }
    end
    assert_template 'products/new'
  end

  test "valid product information" do
  	log_in_as(@user)
    get products_new_path
    assert_difference 'Product.count', 1 do
      post products_path, params: { product: { name:  "Example",
                                         description: "Description",
                                         warehouses_id:   "Warehouse" } }
    end
    follow_redirect!
    assert_template 'products/show'
  end
end
