class PaymentInformation < ActiveRecord::Base

  #Relationship Validations
  belongs_to :buyer

end
