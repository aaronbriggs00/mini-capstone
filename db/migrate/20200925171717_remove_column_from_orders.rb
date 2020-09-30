class RemoveColumnFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :product_id, :integer
    remove_column :orders, :quantity, :string
  end
end
