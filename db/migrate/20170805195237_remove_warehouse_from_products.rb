class RemoveWarehouseFromProducts < ActiveRecord::Migration[5.1]
  def change
  	remove_column :products, :warehouse, :string
  	add_column :products, :warehouses_id, :integer
  end
end
