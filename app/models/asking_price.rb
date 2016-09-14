class AskingPrice < ActiveRecord::Base

  #Relationship Validations
  belongs_to :seller
  has_many :accepted_jobs
  belongs_to :skill
  
end
