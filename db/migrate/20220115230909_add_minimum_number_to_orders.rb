class AddMinimumNumberToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :minimum_number, :float, after: :maximum_number
  end
end
