names = []
File.open('db/csvs/actor_names.csv') do |file|
  f = file.read
  names.concat(f.split(',').map(&:strip))
end

Neo4j::ActiveBase.current_session.query('MATCH ()-[r:ACTED]->() DELETE r;')
Neo4j::ActiveBase.current_session.query('MATCH ()-[r:APPEARED]->() DELETE r;')
Neo4j::ActiveBase.current_session.query('MATCH (n:Actor) DELETE n;')
Neo4j::ActiveBase.current_session.query('MATCH (n:Anime) DELETE n;')
Neo4j::ActiveBase.current_session.query('MATCH (n:Character) DELETE n;')

names.each do |name|
  actor = Actor.find_by(name: name)
  Actor.create(name: name, sh_name: name.gsub(' ', '')) unless actor
end