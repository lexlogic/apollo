# == Schema Information
#
# Table name: equipment
#
#  id              :integer          not null, primary key
#  name            :string
#  description     :text
#  location_id     :integer
#  status          :string
#  serial          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category_id     :integer
#  manufacturer_id :integer
#

class Equipment < ApplicationRecord
    has_many :equipment_parts, dependent: :destroy
    has_many :parts, through: :equipment_parts
    belongs_to :location
    belongs_to :category
    belongs_to :manufacturer
    
    has_paper_trail
    
    STATUS = %w[online offline].freeze
    
    def status?(base_status)
        return false unless status
        STATUS.index(base_status.to_s) <= STATUS.index(status)
    end
    
    def remove_part_from_equipment
        equipment = Equipment.find(params[:post][:id])
        part = equipment.parts.find(params[:part][:id])
    
        if part
            equipment.parts.delete(part)
        end
    end
    
    def add_part(equipment, part_id)
        equipment = Equipment.find(equipment.id)
        current_part = equipment_parts.find_by(part_id: part_id)
        
        if !current_part
            part = Part.find_by_id(part_id)
            part.qty -= 1
            part.save
        end
    end
end
