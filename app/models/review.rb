class Review < ApplicationRecord
  belongs_to :band

  validates :stars, presence: true
  validates :stars, numericality: true
  validates :stars, numericality: { :only_integer => false, :greater_than_or_equal_to => 0 }
  validates :stars, numericality: { :only_integer => false, :less_than_or_equal_to => 5 }

end
