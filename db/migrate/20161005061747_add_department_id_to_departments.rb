class AddDepartmentIdToDepartments < ActiveRecord::Migration[4.2]
  def change
    add_column :departments, :department_id, :integer
    
    add_index :departments, :department_id
  end
end
