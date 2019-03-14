class ComparisonsController < ApplicationController
  def index
    @actors = Actor.all
    @comparison = Comparison.new
  end

  def show
    @comparison = Comparison.new(comparison_params)
    if @comparison.valid?
      @co_anime = @comparison.co_animation
    else
      @actors = Actor.all
      render :index
    end
  end

  private

  def comparison_params
    params.require(:comparison).permit(actor_ids: [])
  end
end
