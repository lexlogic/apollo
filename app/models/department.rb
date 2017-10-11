# == Schema Information
#
# Table name: departments
#
#  id            :integer          not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#

class Department < ApplicationRecord
    belongs_to :department
    has_many :children, :dependent => :destroy, :class_name => 'Department'
    has_many :parts
    has_many :shift_reports
    
    has_paper_trail
    
    default_scope {where(department_id: nil)}
    
end
