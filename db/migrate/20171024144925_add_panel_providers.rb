class AddPanelProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :panel_providers do |t|
      t.string :code, limit: 10, index: true, null: false

      t.timestamps null: false
    end
  end
end
