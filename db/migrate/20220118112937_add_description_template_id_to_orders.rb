class AddDescriptionTemplateIdToOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :description_template_id, :integer
    add_reference :orders, :description_template, null: true, foreign_key: true
  end
end
