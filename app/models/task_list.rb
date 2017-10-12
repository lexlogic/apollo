# == Schema Information
#
# Table name: todos
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string           default("open")
#  user_id    :integer
#

class TaskList < ApplicationRecord
    belongs_to :user
    has_paper_trail
    
    STATUS = %w[open started complete].freeze
    
    def status?(base_status)
        return false unless status
        STATUS.index(base_status.to_s) <= STATUS.index(status)
    end
end
