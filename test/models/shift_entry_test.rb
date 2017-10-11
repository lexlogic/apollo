# == Schema Information
#
# Table name: shift_entries
#
#  id              :integer          not null, primary key
#  time            :string
#  job_name        :string
#  description     :text
#  downtime        :string
#  department_id   :integer
#  location_id     :integer
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  shift_report_id :integer
#

require 'test_helper'

class ShiftEntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
