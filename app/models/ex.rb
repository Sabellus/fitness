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

class Ex < ApplicationRecord
  acts_as_paranoid
  has_and_belongs_to_many :programs
end
