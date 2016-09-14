class Buyer < ActiveRecord::Base

  #Relationship Validations
  belongs_to :user
  has_many :job_postings
  has_many :payment_informations

end
