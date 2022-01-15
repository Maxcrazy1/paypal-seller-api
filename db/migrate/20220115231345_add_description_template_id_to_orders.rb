class AddDescriptionTemplateIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :description_template_id, :integer, after: :operation_type_id
  end
end
