class Program < ApplicationRecord
  acts_as_paranoid
  has_and_belongs_to_many :exes
end
