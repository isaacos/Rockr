class Band < ApplicationRecord
  has_many :musician_bands
  has_many :musicians, through: :musician_bands
  has_many :reviews

  def average_rating
    rating_array = self.reviews.map do |review|
      review.stars
    end
    rating_array.inject(:+)/rating_array.length
  end
end
