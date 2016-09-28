# == Schema Information
#
# Table name: job_postings
#
#  id              :integer          not null, primary key
#  job_name        :string
#  description     :text
#  skills_required :text
#  estimated_time  :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

require 'test_helper'

class JobPostingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
