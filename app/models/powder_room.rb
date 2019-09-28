class PowderRoom < ApplicationRecord
  has_ancestry

  # Association
  has_one :detail
end
