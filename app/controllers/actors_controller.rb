class ActorsController < ApplicationController
  before_action :set_actor, only: %i[show update]
  def index
    @q = Actor.ransack(params[:q])
    @actors = @q.result(distinct: true)
  end

  def show; end

  def edit; end

  def update
    if @actor.update(actor_params)
      redirect_to @actor, notice: 'successfully updated'
    else
      render :edit
    end
  end

  private

  def set_actor
    @actor = Actor.find(params[:id])
  end

  def actor_params
    params.require(:actor).permit(:name, :sh_name)
  end
end
