names = []
File.open('db/csvs/actor_names.csv') do |file|
  f = file.read
  names.concat(f.split(',').map(&:strip))
end

names.each do |name|
  Actor.create(name: name)
end