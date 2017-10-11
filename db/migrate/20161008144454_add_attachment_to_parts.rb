class AddAttachmentToParts < ActiveRecord::Migration[4.2]
    add_column :parts, :attachment, :string
  end
end
