class CreateDescriptionTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :description_templates do |t|
      t.references :user
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
