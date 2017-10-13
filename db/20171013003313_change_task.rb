class ChangeTask < ActiveRecord::Migration[5.1]
  def change
  	rename_table :task_list, :todos
  end
end
