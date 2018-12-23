class Musician < ApplicationRecord
  has_many :genre_musicians
  has_many :musician_bands
  has_many :genres, through: :genre_musicians
  has_many :bands, through: :musician_bands
end
