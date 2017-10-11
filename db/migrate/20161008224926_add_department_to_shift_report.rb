class AddDepartmentToShiftReport < ActiveRecord::Migration[4.2]
  def change
    add_reference :shift_reports, :department, index: true
  end
end
