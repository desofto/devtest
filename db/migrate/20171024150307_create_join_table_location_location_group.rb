class CreateJoinTableLocationLocationGroup < ActiveRecord::Migration[5.1]
  def change
    create_join_table :locations, :location_groups do |t|
      # t.index [:location_id, :location_group_id]
      # t.index [:location_group_id, :location_id]
    end
  end
end
