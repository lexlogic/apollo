class AddStatusToTodo < ActiveRecord::Migration[4.2]
  def change
    add_column :todos, :status, :string
    
    add_index :todos, :status
  end
end
