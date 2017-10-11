class CreateEquipmentParts < ActiveRecord::Migration[4.2]
  def up
    create_table :equipment_parts, :id => false do |t|
      t.integer :equipment_id, :null => false
      t.integer :part_id, :null => false
    end
    
    add_index :equipment_parts, [:equipment_id, :part_id], :unique => true
  end
  def down
    remove_index :equipment_parts, :column => [:equipment_id, :part_id]
    drop_table :equipment_parts
  end
end
