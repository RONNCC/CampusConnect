class User < ActiveRecord::Base

  #Use built-in rails support for password protection
  has_secure_password
  
  #Relationship Validations
  has_many :job_postings
  has_many :skills
  
  #Validations

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

end
