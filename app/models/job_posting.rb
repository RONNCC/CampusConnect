class JobPosting < ActiveRecord::Base

  #Relationship Validations
  has_one :accepted_job
  belongs_to :user

  #scopes
  scope :open_for_user, ->(uid) { joins("left outer join accepted_jobs on job_postings.id = accepted_jobs.job_posting_id").where("job_postings.user_id = ? and accepted_jobs.id IS NULL", uid) }
  scope :open_not_for_user, ->(uid) { joins("left outer join accepted_jobs on job_postings.id = accepted_jobs.job_posting_id").where("job_postings.user_id != ? and accepted_jobs.id IS NULL", uid) }

  

end
