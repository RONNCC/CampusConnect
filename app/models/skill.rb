class Skill < ActiveRecord::Base

  #Relationship Validations
  has_many :asking_prices

end
