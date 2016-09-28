# == Schema Information
#
# Table name: asking_prices
#
#  id         :integer          not null, primary key
#  skill_id   :integer
#  price      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :string
#

require 'test_helper'

class AskingPriceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
