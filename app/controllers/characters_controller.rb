class CharactersController < ApplicationController
  before_action :set_character, only: %i[show edit update]

  def index
    @q = Character.ransack(params[:q])
    @characters = @q.result(distinct: true)
  end

  def show; end

  def edit; end

  def update
    if @character.update(actor_params)
      redirect_to @character, notice: 'successfully updated'
    else
      render :edit
    end
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name)
  end
end
