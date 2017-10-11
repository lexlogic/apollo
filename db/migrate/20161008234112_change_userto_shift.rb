class ChangeUsertoShift < ActiveRecord::Migration[4.2]
  def change
    change_table(:shift_entries) do |t|
       t.column :shift_report_id, :integer
    end
  end
end
