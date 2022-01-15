class AddOperationTypeIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :operation_type_id, :integer, after: :maximum_number
  end
end
