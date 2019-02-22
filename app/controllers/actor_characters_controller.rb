class ActorCharactersController < ApplicationController

  def index
    @q = ActorCharacter.ransack(params[:q])
    @actor_characters = @q.result(distinct: true).page(params[:page])
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
