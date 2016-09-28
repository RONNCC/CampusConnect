# == Schema Information
#
# Table name: accepted_jobs
#
#  id               :integer          not null, primary key
#  job_posting_id   :integer
#  asking_price_id  :integer
#  seller_review    :text
#  buyer_review     :text
#  seller_rating    :integer
#  buyer_rating     :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  buyer_completed  :boolean
#  seller_completed :boolean
#

require 'test_helper'

class AcceptedJobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
