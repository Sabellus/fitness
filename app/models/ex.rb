class Ex < ApplicationRecord
  acts_as_paranoid
  has_and_belongs_to_many :programs
end
