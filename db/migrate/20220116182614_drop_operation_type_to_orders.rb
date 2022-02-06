class DropOperationTypeToOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :operation_type, :string
  end
end
