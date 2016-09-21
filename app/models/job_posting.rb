class JobPosting < ActiveRecord::Base

  #scopes
  scope :for_user, ->(bid) { where("buyer_id = ?", bid) }
  scope :not_for_user, ->(bid) { where("buyer_id != ?", bid) }

  #Relationship Validations
  has_one :accepted_job
  belongs_to :buyer

end
