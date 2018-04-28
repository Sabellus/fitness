class Training < ApplicationRecord
  acts_as_paranoid
  belongs_to :program
end
