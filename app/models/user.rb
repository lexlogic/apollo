# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :string
#  username               :string
#  full_name              :string
#  last_seen              :datetime
#

class User < ApplicationRecord
  has_paper_trail :on => [:create, :destroy]
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :rememberable, :trackable, :validatable, :lastseenable, :authentication_keys => [:email]
         
  ROLES = %w[admin supervisor worker vendor testing].freeze
  
  has_many :work_orders
  has_many :events
  has_many :task_lists
  
  validates :username, :email, :full_name, presence: true
  validates :password, :password_confirmation, presence: true, on: :create
  validates :password, confirmation: true
         
  def role?(base_role)
    return false unless role
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  
  private    
  def password_required?
    new_record? ? super : false
  end
  
end
