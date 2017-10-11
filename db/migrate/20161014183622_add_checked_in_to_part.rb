class AddCheckedInToPart < ActiveRecord::Migration[4.2]
  def change
    add_column :parts, :checkedIn, :boolean
  end
end
