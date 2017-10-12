class RenameTodosToTaskList < ActiveRecord::Migration[4.2]
  def change
  	 rename_table :todos, :task_list
  end
end
