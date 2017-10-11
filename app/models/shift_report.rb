# == Schema Information
#
# Table name: shift_reports
#
#  id            :integer          not null, primary key
#  name          :string
#  equipment_id  :integer
#  down_time     :string
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#  location_id   :integer
#

class ShiftReport < ApplicationRecord
    has_many :shift_entries
    
    belongs_to :department
    belongs_to :location
end
