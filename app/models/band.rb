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

  def musicians_not_in_band
    bands_musicians = self.musicians
    all_musicians = Musician.all
      all_musicians.select do |musician|
        bands_musicians.exclude?(musician)
      end
  end
end
