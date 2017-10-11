# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location_id :integer
#

class Location < ApplicationRecord
    belongs_to :location
    has_many :children, :dependent => :destroy, :class_name => 'Location'
    has_many :equipment
    has_many :parts
    has_many :shift_reports
    
    has_paper_trail
    
end
