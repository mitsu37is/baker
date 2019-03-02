# frozen_string_literal: true

class Comparison
  include ActiveModel::Model

  def self.co_animation(actor1, actor2)
    actor1.anime & actor2.anime
  end
end