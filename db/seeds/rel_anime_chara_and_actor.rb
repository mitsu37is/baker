require 'csv'

animes = ['進撃の巨人']

animes.each do |anime_name|
  anime_node = Anime.find_by(name: anime_name)
  Anime.create(name: anime_name) unless anime_node

  CSV.foreach("db/csvs/pixiv_anime_#{anime_name}.csv") do |row|
    character_name = row[0]
    actor_name = row[1]

    character_node = Character.find_by(name: character_name)
    actor_node = Actor.find_by(sh_name: actor_name)

    Character.create(name: character_name) unless character_node
    Actor.create(sh_name: actor_name) unless actor_node

    character_node = Character.find_by(name: character_name)
    actor_node = Actor.find_by(sh_name: actor_name)

    Neo4j::ActiveBase.current_session.query("MATCH (n:Actor{sh_name: '#{actor_name}'})-[r:ACTED]->(q:Character{name: '#{character_name}'}) DELETE r;")
    Neo4j::ActiveBase.current_session.query("MATCH (n:Character{name: '#{character_name}'})-[r:APPEARED]->(q:Anime{name: '#{anime_name}'}) DELETE r;")

    Acted.create(from_node: actor_node, to_node: character_node)
    Appeared.create(from_node: character_node, to_node: anime_node)
  end
end