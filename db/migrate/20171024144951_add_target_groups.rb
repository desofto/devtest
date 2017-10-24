class AddTargetGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :target_groups do |t|
      t.string :name
      t.integer :external_id
      t.references :parent, reference: :target_groups, index: true
      t.string :secret_code
      t.references :panel_provider, index: true

      t.timestamps null: false
    end
  end
end
