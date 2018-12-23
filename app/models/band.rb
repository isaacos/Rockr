class Band < ApplicationRecord
  has_many :musician_bands
  has_many :musicians, through: :musician_bands
end
