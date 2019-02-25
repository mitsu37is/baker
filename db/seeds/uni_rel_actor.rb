require 'csv'

actor_name = '小松未可子'
actor = Actor.find_or_create_by(sh_name: actor_name)

CSV.foreach("db/csvs/pixiv_actor_#{actor_name}.csv") do |row|
  character_name = row[0]
  anime_title = row[1]

  character = Character.find_or_create_by(name: character_name)
  anime = Anime.find_or_create_by(title: anime_title)

  ActorCharacter.find_or_create_by(actor_id: actor.id, character_id: character.id)
  AnimeCharacter.find_or_create_by(anime_id: anime.id, character_id: character.id)
end