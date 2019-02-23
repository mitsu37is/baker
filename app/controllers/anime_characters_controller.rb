class AnimeCharactersController < ApplicationController
  before_action :authenticate_user!

  def new
    @anime_character = AnimeCharacter.new
  end

  def create
    anime = Anime.find_or_create_by(title: anime_character_params[:anime_title].delete(' '))
    character = Character.find_or_create_by(name: anime_character_params[:character_name].delete(' '))
    AnimeCharacter.find_or_create_by(anime_id: anime.id, character_id: character.id)
    redirect_to root_path
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def anime_character_params
    params.require(:anime_character).permit(:anime_title, :character_name)
  end
end
