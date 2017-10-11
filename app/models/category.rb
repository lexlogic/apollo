# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  category_id :integer
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Category < ApplicationRecord
    belongs_to :category
    has_many :children, -> { order(:name) }, :dependent => :destroy, :class_name => 'Category'
    has_many :equipment
    
    has_paper_trail
    
    default_scope {where(category_id: nil)}
    
    validates :name, presence: true
end
