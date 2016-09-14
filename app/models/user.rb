class User < ActiveRecord::Base

  #Use built-in rails support for password protection
  has_secure_password
  
  #Relationship Validations
  has_one :seller
  has_one :buyer
  
  #Validations

  ROLES = [['Administrator', :admin], ['Buyer', :buyer], ['Seller', :seller], ['Buyer/Seller', :bser]]
  PROLES = [['Buyer', :buyer], ['Seller', :seller], ['Buyer/Seller', :bser]]

  #Methods
  def self.authenticate(username,password)
    find_by_username(username).try(:authenticate, password)
  end

end
