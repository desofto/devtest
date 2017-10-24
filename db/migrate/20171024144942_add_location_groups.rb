class AddLocationGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :location_groups do |t|
      t.string :name
      t.references :country, index: true
      t.references :panel_provider, index: true

      t.timestamps null: false
    end
  end
end
