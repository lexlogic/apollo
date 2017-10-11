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

require 'test_helper'

class PartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
