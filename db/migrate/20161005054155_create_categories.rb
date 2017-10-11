class CreateCategories < ActiveRecord::Migration[4.2]
  def change
        create_table :categories do |t|
            t.belongs_to :category
            t.string :name, :null => false
            t.timestamps
        end
    end
end
