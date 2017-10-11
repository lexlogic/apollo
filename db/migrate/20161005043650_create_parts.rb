class CreateParts < ActiveRecord::Migration[4.2]
  def change
    create_table :parts do |t|
      t.string :name
      t.text :description
      t.integer :location_id
      t.string :sku

      t.timestamps
    end
  end
end
