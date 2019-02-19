class Anime < ApplicationRecord
  validates :title, presence: true

  has_many :characters, through: :anime_characters
  has_many :anime_characters
end
