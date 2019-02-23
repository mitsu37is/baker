class Character < ApplicationRecord
  validates :name, presence: true

  has_many :actor_characters, dependent: :destroy
  has_many :anime_characters, dependent: :destroy
  has_many :actors, through: :actor_characters
  has_many :anime, through: :anime_characters
end
