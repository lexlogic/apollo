class AddLocationToLocation < ActiveRecord::Migration[4.2]
  def change
    add_column :locations, :location_id, :integer
    
    add_index :locations, :location_id
  end
end
