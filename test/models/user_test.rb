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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
