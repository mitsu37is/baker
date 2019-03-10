class Actor < ApplicationRecord
  validates :sh_name, presence: true

  has_many :actor_characters, dependent: :destroy
  has_many :characters, through: :actor_characters
  has_many :actor_animes, dependent: :destroy
  has_many :anime, through: :actor_animes

  def character(anime)
    characters.select{|character| character if character.anime.include?(anime)}
  end
end
