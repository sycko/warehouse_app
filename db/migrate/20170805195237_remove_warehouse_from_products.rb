class RemoveWarehouseFromProducts < ActiveRecord::Migration[5.1]
  def change
  	remove_column :products, :warehouses, :string
  	add_column :products, :warehouses_id, :integer
  end
end
