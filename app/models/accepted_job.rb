# == Schema Information
#
# Table name: accepted_jobs
#
#  id               :integer          not null, primary key
#  job_posting_id   :integer
#  asking_price_id  :integer
#  seller_review    :text
#  buyer_review     :text
#  seller_rating    :integer
#  buyer_rating     :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  buyer_completed  :boolean
#  seller_completed :boolean
#

class AcceptedJob < ActiveRecord::Base

  #Relationship Validations
  belongs_to :asking_price
  belongs_to :job_posting

  #Scopes
  # scope :open_not_for_user, ->(uid) { joins("left outer join accepted_jobs on job_postings.id = accepted_jobs.job_posting_id").where("job_postings.user_id != ? and accepted_jobs.id IS NULL", uid) }
  scope :for_user_buyer, -> (uid) {joins(:job_posting => :user).where("users.id = ?", uid)}
  scope :for_user_seller, -> (uid) {joins(:asking_price => {:skill => :user}).where("users.id = ?", uid)}
  scope :comp_for_user_buyer, -> (uid) {joins(:job_posting => :user).where("(users.id = ?)", uid).where(buyer_completed: true).where(seller_completed: true)}
  scope :comp_for_user_seller, -> (uid) {joins(:asking_price => {:skill => :user}).where("(users.id = ?)", uid).where(buyer_completed: true).where(seller_completed: true)}
  # scope :not_comp_for_user_buyer, -> (uid) {joins(:job_posting => :user).where("(users.id = ?)", uid).where('buyer_completed = ? OR seller_completed = ?')}
  # scope :not_comp_for_user_seller, -> (uid) {joins(:asking_price => {:skill => :user}).where("(users.id = ?)", uid).where('buyer_completed = "f" OR seller_completed = "f"')}

  #Methods
  def completed?
    self.buyer_completed & self.seller_completed
  end
end
