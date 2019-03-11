require 'csv'

animes = ['進撃の巨人', '名探偵コナン']

animes.each do |anime_title|
  anime = Anime.find_or_create_by(title: anime_title)

  CSV.foreach("db/csvs/pixiv_anime_#{anime_title}.csv") do |row|
    character_name = row[0]
    actor_name = row[1]

    character = Character.find_or_create_by(name: character_name)
    actor = Actor.find_or_create_by(sh_name: actor_name)

    ActorCharacter.find_or_create_by(actor_id: actor.id, character_id: character.id)
    AnimeCharacter.find_or_create_by(anime_id: anime.id, character_id: character.id)
    ActorAnime.find_or_create_by(actor_id: actor.id, anime_id: anime.id)
  end
end