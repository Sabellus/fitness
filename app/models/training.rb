# == Schema Information
#
# Table name: trainings
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  comments   :string
#  circle     :integer
#  program_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
# Indexes
#
#  index_trainings_on_deleted_at  (deleted_at)
#  index_trainings_on_program_id  (program_id)
#

class Training < ApplicationRecord
  acts_as_paranoid
  belongs_to :program
end
