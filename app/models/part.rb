# == Schema Information
#
# Table name: parts
#
#  id            :integer          not null, primary key
#  name          :string
#  description   :text
#  location_id   :integer
#  sku           :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  part_url      :string
#  document      :string
#  attachment    :string
#  department_id :integer
#  qty           :integer
#  checkedIn     :boolean
#

class Part < ApplicationRecord
    has_many :equipment_parts
    belongs_to :location
    belongs_to :department
    
    before_destroy :ensure_not_referenced_by_any_equipment
    
    has_paper_trail
    
    
    mount_uploader :attachment, AttachmentUploader
    
    def ensure_not_referenced_by_any_equipment
        if equipment_parts.empty?
            return true
        else 
            errors.add(:base, 'Part is being used')
            return false
        end
    end
    
end
