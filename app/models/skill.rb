class Skill < ActiveRecord::Base

  #Relationship Validations
  has_many :asking_prices
  belongs_to :user

  #Scopes
  scope :for_user, ->(uid) { where("user_id = ?", uid) }

end
