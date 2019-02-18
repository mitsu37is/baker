require 'csv'

# to avoid duplication of nodes and relationships,
# at first delete all relationship data.
Neo4j::ActiveBase.current_session.query('MATCH ()-[r:ACTED]->() DELETE r;')
Neo4j::ActiveBase.current_session.query('MATCH ()-[r:APPEARED]->() DELETE r;')
Neo4j::ActiveBase.current_session.query('MATCH (n:Anime) DELETE n;')
Neo4j::ActiveBase.current_session.query('MATCH (n:Character) DELETE n;')

actor_names = ['小野 大輔', '神谷 浩史', '花澤 香菜', '梶 裕貴']
actor_names.each do |actor_name|
  CSV.foreach("db/csvs/pixiv_actor_#{actor_name.gsub(" ", "")}.csv") do |row|
    character_name = row[0]
    anime_name = row[1]

    character = Character.find_by(name: character_name)
    anime = Anime.find_by(name: anime_name)

    Character.create(name: character_name) unless character
    Anime.create(name: anime_name) unless anime
  end
end