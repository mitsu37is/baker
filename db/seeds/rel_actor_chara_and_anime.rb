require 'csv'

# to avoid duplication of nodes and relationships,
# at first delete all relationship data.
Neo4j::ActiveBase.current_session.query('MATCH ()-[r:ACTED]->() DELETE r;')
Neo4j::ActiveBase.current_session.query('MATCH ()-[r:APPEARED]->() DELETE r;')

actor_names = ['小野 大輔', '神谷 浩史', '花澤 香菜', '梶 裕貴']

actor_names.each do |actor_name|
  actor_node = Actor.find_by(name: actor_name)

  CSV.foreach("db/csvs/pixiv_actor_#{actor_name.gsub(" ", "")}.csv") do |row|
    character_name = row[0]
    anime_name = row[1]

    character_node = Character.find_by(name: character_name)
    anime_node = Anime.find_by(name: anime_name)

    Acted.create(from_node: actor_node, to_node: character_node)
    Appeared.create(from_node: character_node, to_node: anime_node)
  end
end