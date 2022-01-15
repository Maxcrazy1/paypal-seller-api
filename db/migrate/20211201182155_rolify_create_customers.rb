class RolifyCreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table(:customers) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_customers, :id => false) do |t|
      t.references :user
      t.references :customer
    end
    
    add_index(:customers, [ :name, :resource_type, :resource_id ])
    add_index(:users_customers, [ :user_id, :customer_id ])
  end
end
