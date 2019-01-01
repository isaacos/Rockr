class Band < ApplicationRecord
  has_many :musician_bands
  has_many :musicians, through: :musician_bands
  has_many :reviews

  validates :band_name, presence: true
  validates :band_name, uniqueness: true

  def average_rating
    rating_array = self.reviews.map do |review|
      review.stars
    end
    rating_array.inject(:+)/rating_array.length
  end
end
