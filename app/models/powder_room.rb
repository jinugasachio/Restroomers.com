class PowderRoom < ApplicationRecord
  has_ancestry

  # Association
  has_one :detail
  has_one :facility
  has_many :images
end
