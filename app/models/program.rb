# == Schema Information
#
# Table name: programs
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
# Indexes
#
#  index_programs_on_deleted_at  (deleted_at)
#

class Program < ApplicationRecord
  acts_as_paranoid
  has_and_belongs_to_many :exes
end
