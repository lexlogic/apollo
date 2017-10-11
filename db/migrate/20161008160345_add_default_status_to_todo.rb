class AddDefaultStatusToTodo < ActiveRecord::Migration[4.2]
  def change
    change_column :todos, :status, :string, :default => "open"
  end
end
