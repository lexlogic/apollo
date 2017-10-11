class CreateEquipment < ActiveRecord::Migration[4.2]
  def change
    create_table :equipment do |t|
      t.string :name
      t.text :description
      t.integer :location_id
      t.string :status
      t.string :manufacturer
      t.string :serial

      t.timestamps
    end
  end
end
