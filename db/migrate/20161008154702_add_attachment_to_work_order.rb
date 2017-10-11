class AddAttachmentToWorkOrder < ActiveRecord::Migration[4.2]
  def change
    add_column :work_orders, :attachment, :string
  end
end
