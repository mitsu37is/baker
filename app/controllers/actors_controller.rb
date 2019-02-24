class ActorsController < ApplicationController
  before_action :set_actor, only: %i[show edit update destroy]
  def index
    @q = Actor.ransack(params[:q])
    @actors = @q.result(distinct: true).page(params[:page])
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

  def destroy
    @actor.destroy
    redirect_to root_path
  end

  private

  def set_actor
    @actor = Actor.find(params[:id])
  end

  def actor_params
    params.require(:actor).permit(:name)
  end
end
