class AddMaximumNumberToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :maximum_price, :float, after: :price
  end
end
