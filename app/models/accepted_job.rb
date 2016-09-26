class AcceptedJob < ActiveRecord::Base

  #Relationship Validations
  belongs_to :asking_price
  belongs_to :job_posting

  #Scopes
  scope :open_not_for_user, ->(uid) { joins("left outer join accepted_jobs on job_postings.id = accepted_jobs.job_posting_id").where("job_postings.user_id != ? and accepted_jobs.id IS NULL", uid) }
  scope :for_user_buyer, -> (uid) {joins(:job_posting => :user).where("users.id = ?", uid)}
  scope :for_user_seller, -> (uid) {joins(:asking_price => {:skill => :user}).where("users.id = ?", uid)}

  #Methods
  def completed?
    self.buyer_completed & self.seller_completed
  end
end
