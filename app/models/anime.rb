class Anime < ApplicationRecord
  validates :title, presence: true

  has_many :anime_characters, dependent: :destroy
  has_many :characters, through: :anime_characters
  has_many :actor_animes, dependent: :destroy
  has_many :actors, through: :actor_animes
end
