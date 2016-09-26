class JobPosting < ActiveRecord::Base

  #Relationship Validations
  has_one :accepted_job
  belongs_to :user

  #Validations
  validates_presence_of :job_name, :description, :skills_required, :estimated_time
  validates_length_of :job_name, maximum: 20, minimum: 4, message: "Must be between 4 and 20 characters long.", allow_blank: false
  validates_length_of :description, maximum: 400, minimum: 4, message: "Must be between 4 and 100 characters long.", allow_blank: false
  validates_length_of :estimated_time, maximum: 20, minimum: 4, message: "Must be between 4 and 20 characters long.", allow_blank: false
  validates_length_of :skills_required, maximum: 100, minimum: 4, message: "Must be between 4 and 20 characters long.", allow_blank: false

  #scopes
  scope :open_for_user, ->(uid) { joins("left outer join accepted_jobs on job_postings.id = accepted_jobs.job_posting_id").where("job_postings.user_id = ? and accepted_jobs.id IS NULL", uid) }
  scope :open_not_for_user, ->(uid) { joins("left outer join accepted_jobs on job_postings.id = accepted_jobs.job_posting_id").where("job_postings.user_id != ? and accepted_jobs.id IS NULL", uid) }

  

end
