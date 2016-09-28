# == Schema Information
#
# Table name: skills
#
#  id          :integer          not null, primary key
#  skill       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Skill < ActiveRecord::Base

  #Relationship Validations
  has_many :asking_prices
  belongs_to :user

  #Validations
  validates_presence_of :skill, :description
  validates_length_of :skill, maximum: 20, minimum: 4, message: "Must be between 4 and 20 characters long.", allow_blank: false
  validates_length_of :skill, maximum: 100, minimum: 4, message: "Must be between 4 and 100 characters long.", allow_blank: false

  #Scopes
  scope :for_user, ->(uid) { where("user_id = ?", uid) }

end
