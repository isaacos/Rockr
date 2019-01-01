class Musician < ApplicationRecord
  has_many :genre_musicians
  has_many :musician_bands
  has_many :genres, through: :genre_musicians
  has_many :bands, through: :musician_bands

  validates :name, presence: true
  validates :instrument, presence: true

  def instrument_capitalize
    instrument = self.instrument.split.map(&:capitalize).join(' ')
    self.instrument = instrument
  end

  def self.genre_type(genre_name)
    Genre.find_by(genre_name: genre_name).musicians
  end
end
