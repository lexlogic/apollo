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

require 'test_helper'

class EquipmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
