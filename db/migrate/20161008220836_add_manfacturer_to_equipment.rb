class AddManfacturerToEquipment < ActiveRecord::Migration[4.2]
  def change
    add_reference :equipment, :manufacturer, index: true
  end
end
