class AddCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :country_code, limit: 3, null: false, index: true
      t.references :panel_provider, index: true

      t.timestamps null: false
    end
  end
end
