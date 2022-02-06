class AddOperationTypeIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :operation_type, null: false, foreign_key: true
  end
end
