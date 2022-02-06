class AddMinimumNumberToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :minimum_price, :float, after: :maximum_price
  end
end
