class ActorCharactersController < ApplicationController
  before_action :authenticate_user!

  def new
    @actor_character = ActorCharacter.new
  end

  def create
    actor = Actor.find_or_create_by(sh_name: actor_character_params[:actor_sh_name].delete(' '))
    character = Character.find_or_create_by(name: actor_character_params[:character_name].delete(' '))
    ActorCharacter.find_or_create_by(actor_id: actor.id, character_id: character.id)
    redirect_to root_path
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def actor_character_params
    params.require(:actor_character).permit(:actor_sh_name, :character_name)
  end
end
