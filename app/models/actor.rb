class Actor < ApplicationRecord
  has_many :actor_characters
  has_many :characters, through: :actor_characters
end
