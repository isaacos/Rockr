class Genre < ApplicationRecord
  has_many :genre_musicians
  has_many :musicians, through: :genre_musicians
end
