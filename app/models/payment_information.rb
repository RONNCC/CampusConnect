# == Schema Information
#
# Table name: payment_informations
#
#  id          :integer          not null, primary key
#  card_number :integer
#  cvv_code    :integer
#  address     :string
#  zip_code    :string
#  city        :string
#  state       :string
#  country     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class PaymentInformation < ActiveRecord::Base

  #Relationship Validations
  belongs_to :buyer

end
