class PowderRoom < ApplicationRecord
  has_ancestry

  # Association
  has_one :detail
  has_one :facility
end
