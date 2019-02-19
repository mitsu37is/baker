class RenameActorsCharactersToActorCharacter < ActiveRecord::Migration[5.2]
  def change
    rename_table :actors_characters, :actor_characters
    rename_table :animes_characters, :anime_characters
  end
end
