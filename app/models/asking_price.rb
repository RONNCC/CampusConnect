class AskingPrice < ActiveRecord::Base

  #Relationship Validations
  has_many :accepted_jobs
  belongs_to :skill

  #Scopes
  scope :open_for_user, ->(uid) { joins("left outer join accepted_jobs on asking_prices.id = accepted_jobs.asking_price_id join skills on asking_prices.skill_id = skills.id").where("skills.user_id = ? and accepted_jobs.id IS NULL", uid) }
  scope :open_not_for_user, ->(uid) { joins("left outer join accepted_jobs on asking_prices.id = accepted_jobs.asking_price_id join skills on asking_prices.skill_id = skills.id").where("skills.user_id != ? and accepted_jobs.id IS NULL", uid) }
  
end
