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

end
