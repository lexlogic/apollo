class AddDocumentToParts < ActiveRecord::Migration[4.2]
  def change
    add_column :parts, :document, :string
  end
end
