# == Schema Information
#
# Table name: equipment_parts
#
#  equipment_id :integer          not null
#  part_id      :integer          not null
#

class EquipmentPart < ApplicationRecord
    self.table_name = :equipment_parts
    
    belongs_to :equipment
    belongs_to :part
end
