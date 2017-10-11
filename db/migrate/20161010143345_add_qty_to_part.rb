class AddQtyToPart < ActiveRecord::Migration[4.2]
  def change
    add_column :parts, :qty, :integer
  end
end
