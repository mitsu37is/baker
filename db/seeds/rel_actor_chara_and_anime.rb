require 'csv'

actor_names = CSV.read('db/csvs/actor_names.csv')[0]

actor_names.each do |actor_name|
  actor = Actor.find_by(name: actor_name)

  if File.exist?("db/csvs/pixiv_actor_#{actor_name.delete(' ')}.csv")
    puts actor_name
    CSV.foreach("db/csvs/pixiv_actor_#{actor_name.gsub(' ', '')}.csv") do |row|
      character_name = row[0]
      anime_title = row[1]

      character = Character.find_or_create_by(name: character_name)
      anime = Anime.find_or_create_by(title: anime_title)

      ActorCharacter.find_or_create_by(actor_id: actor.id, character_id: character.id)
      AnimeCharacter.find_or_create_by(anime_id: anime.id, character_id: character.id)
    end
  else
    next
  end
end