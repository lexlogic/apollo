class AddLocationToShiftReport < ActiveRecord::Migration[4.2]
  def change
    add_reference :shift_reports, :location, index: true
  end
end
