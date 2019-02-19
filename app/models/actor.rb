class Actor < ApplicationRecord
  validates :name, presence: true

  has_many :characters, through: :actor_characters
  has_many :actor_characters
end
