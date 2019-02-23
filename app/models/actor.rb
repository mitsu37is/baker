class Actor < ApplicationRecord
  validates :sh_name, presence: true

  has_many :actor_characters
  has_many :characters, through: :actor_characters
end
