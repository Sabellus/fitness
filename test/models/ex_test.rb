# == Schema Information
#
# Table name: exes
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :string
#  count       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :datetime
#
# Indexes
#
#  index_exes_on_deleted_at  (deleted_at)
#

require 'test_helper'

class ExTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
