class ActorAnime < ApplicationRecord
  validates :actor_id, :anime_id, presence: true
  belongs_to :actor
  belongs_to :anime
end
