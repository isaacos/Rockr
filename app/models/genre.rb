class Genre < ApplicationRecord
  has_many :genre_musicians
  has_many :musicians, through: :genre_musicians

  validates :genre_name, presence: true
  validates :genre_name, uniqueness: true
  validates :description, presence: true
  validates :description, length: {maximum: 1000}
end
