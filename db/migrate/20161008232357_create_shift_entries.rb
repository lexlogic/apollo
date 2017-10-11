class CreateShiftEntries < ActiveRecord::Migration[4.2]
  def change
    create_table :shift_entries do |t|
      t.string :time
      t.string :job_name
      t.text :description
      t.string :downtime
      t.integer :department_id
      t.integer :location_id
      t.integer :user_id

      t.timestamps
    end
  end
end
