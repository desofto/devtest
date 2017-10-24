class AddLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :external_id
      t.string :secret_code

      t.timestamps null: false
    end
  end
end
