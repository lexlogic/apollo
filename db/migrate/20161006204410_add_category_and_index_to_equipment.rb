class AddCategoryToEquipment < ActiveRecord::Migration[4.2]
  def change
    add_column :equipment, :category_id, :integer
    
    add_index :equipment, :category_id
  end
end
