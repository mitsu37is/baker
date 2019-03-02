class ComparisonsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def show
    @actor1 = Actor.find(params[:actor_ids][1])
    @actor2 = Actor.find(params[:actor_ids][2])
    @co_anime = Comparison.co_animation(@actor1, @actor2)
  end
end
