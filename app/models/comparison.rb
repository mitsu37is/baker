# frozen_string_literal: true

class Comparison
  include ActiveModel::Model
  attr_accessor :actor_ids, :actor1, :actor2
  validates :actor_ids, presence: true, length: { is: 3 }

  def set_actors
    @actor1 = Actor.find(actor_ids[1])
    @actor2 = Actor.find(actor_ids[2])
  end

  def co_animation
    set_actors
    @actor1.anime & @actor2.anime
  end
end