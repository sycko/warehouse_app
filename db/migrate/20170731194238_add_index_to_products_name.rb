class AddIndexToProductsName < ActiveRecord::Migration[5.1]
  def change
  	add_index :products, :name, unique: true
  end
end
