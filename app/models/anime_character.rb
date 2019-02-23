class AnimeCharacter < ApplicationRecord
  validates :anime_id, :character_id, presence: true
  belongs_to :anime
  belongs_to :character
end
