class CharactersController < ApplicationController
  before_action :set_character, only: %i[show edit update destroy]

  def index
    @q = Character.ransack(params[:q])
    @characters = @q.result(distinct: true).page(params[:page])
  end

  def show
    @animes = @character.anime
    @actors = @character.actors
  end

  def edit; end

  def update
    if @character.update(character_params)
      redirect_to @character, notice: 'successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @character.destroy
    redirect_to root_path
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :profile)
  end
end
