class RemoveColumnFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :string, :string
  end
end
