class CreateShiftReports < ActiveRecord::Migration[4.2]
  def change
    create_table :shift_reports do |t|
      t.string :name
      t.integer :equipment_id
      t.string :down_time
      t.text :description

      t.timestamps
    end
  end
end
