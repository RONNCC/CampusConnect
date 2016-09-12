class JobPosting < ActiveRecord::Base

  #Relationship Validations
  has_one :accepted_job
  belongs_to :buyer

end
