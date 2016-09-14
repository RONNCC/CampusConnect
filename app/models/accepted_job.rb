class AcceptedJob < ActiveRecord::Base

  #Relationship Validations
  belongs_to :seller
  belongs_to :job_posting

end
