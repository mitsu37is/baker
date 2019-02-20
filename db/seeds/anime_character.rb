# frozen_string_literal: true

require 'csv'

actor_names = CSV.read('db/csvs/actor_names.csv')[0]
actor_names.each do |actor_name|
  puts actor_name
  if File.exist?("db/csvs/pixiv_actor_#{actor_name.delete(' ')}.csv")
    CSV.foreach("db/csvs/pixiv_actor_#{actor_name.delete(' ')}.csv") do |row|
      character_name = row[0]
      anime_title = row[1]

      Character.find_or_create_by(name: character_name)
      Anime.find_or_create_by(title: anime_title)
    end
  else
    next
  end
end