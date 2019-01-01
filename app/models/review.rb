class Review < ApplicationRecord
  belongs_to :band

  validates :stars, presence: true
  validates :stars, numericality: true
  #validates :stars, less_than_or_equal_to: 5
  #validates :stars, greater_than_or_equal_to: 0
end
