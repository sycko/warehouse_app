class RemoveWarehouseFromProducts2 < ActiveRecord::Migration[5.1]
  def change
  	remove_column :products, :warehouse, :string
  end
end
