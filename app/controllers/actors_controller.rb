class ActorsController < ApplicationController
  before_action :set_actor, only: %i[show]
  def index
    @q = Actor.ransack(params[:q])
    @actors = @q.result(distinct: true).page(params[:page])
  end

  def show; end

  private

  def set_actor
    @actor = Actor.find(params[:id])
  end
end
