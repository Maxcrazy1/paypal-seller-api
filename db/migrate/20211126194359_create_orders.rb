class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.decimal :price
      t.string :operation_type
      t.boolean :visible

      t.timestamps
    end
  end
end
