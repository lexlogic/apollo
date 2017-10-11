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

require 'test_helper'

class ShiftReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
