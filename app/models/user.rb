# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  role            :string
#  first_name      :string
#  last_name       :string
#  phone           :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  active          :boolean
#  buyer_bio       :text
#  seller_bio      :text
#

class User < ActiveRecord::Base

  #Use built-in rails support for password protection
  has_secure_password
  
  #Relationship Validations
  has_many :job_postings
  has_many :skills
  
  #Validations
  # Validations
  validates_presence_of :last_name, :first_name, :email
  validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format"
  validates_format_of :phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only"
  validates :username, presence: true, uniqueness: { case_sensitive: false}
  validates_presence_of :password, on: :create 
  validates_presence_of :password_confirmation, on: :create 
  validates_confirmation_of :password, on: :create, message: "does not match"
  validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true

  ROLES = [['Administrator', :admin], ['Buyer', :buyer], ['Seller', :seller], ['Buyer/Seller', :bser]]
  PROLES = [['Buyer', :buyer], ['Seller', :seller], ['Buyer/Seller', :bser]]

  #Methods
  def self.authenticate(username,password)
    find_by_username(username).try(:authenticate, password)
  end

  def name
    self.first_name + " " + self.last_name
  end

  def average_buyer_rating
    jps = self.job_postings
    buy_rats = []
    jps.each do |jp|
      if (not(jp.accepted_job.nil?) and not(jp.accepted_job.buyer_rating.nil?))
        buy_rats.append(jp.accepted_job.buyer_rating)
      end
    end
    res = buy_rats.inject(:+).to_f / buy_rats.length
    res.nan? ? "No Ratings Yet" : res
  end

  def average_seller_rating
    jps = self.job_postings
    sell_rats = []
    jps.each do |jp|
      if (not(jp.accepted_job.nil?) and not(jp.accepted_job.seller_rating.nil?))
        sell_rats.append(jp.accepted_job.seller_rating)
      end
    end
    res = sell_rats.inject(:+).to_f / sell_rats.length
    res.nan? ? "No Ratings Yet" : res
  end

  def seller_accepted_jobs
    self.skills.to_a.map{|s| s.asking_prices.to_a.map{|ap| ap.accepted_jobs.to_a}}.flatten.compact
  end

  def buyer_accepted_jobs
    self.job_postings.to_a.map{|jp| jp.accepted_job}.flatten.compact
  end

end
