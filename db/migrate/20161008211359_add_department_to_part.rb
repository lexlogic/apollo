class AddDepartmentToPart < ActiveRecord::Migration[4.2]
  def change
    add_reference :parts, :department, index: true
  end
end
