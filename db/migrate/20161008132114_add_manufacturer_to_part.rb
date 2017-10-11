class AddManufacturerToPart < ActiveRecord::Migration[4.2]
  def change
    add_column :parts, :part_url, :string
    
    add_index :parts, :part_url
  end
end
