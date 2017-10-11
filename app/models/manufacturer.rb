# == Schema Information
#
# Table name: manufacturers
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Manufacturer < ApplicationRecord
    has_paper_trail
    has_many :equipment
end
