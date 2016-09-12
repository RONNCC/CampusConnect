class User < ActiveRecord::Base

  #Use built-in rails support for password protection
  has_secure_password
  
  #Relationship Validations
  has_one :seller
  has_one :buyer
  
end
