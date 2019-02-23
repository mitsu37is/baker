class ActorCharacter < ApplicationRecord
  validates :actor_id, :character_id, presence: true
  belongs_to :actor
  belongs_to :character
end
