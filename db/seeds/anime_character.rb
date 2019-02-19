# frozen_string_literal: true

require 'csv'

actor_names = ['小野 大輔', '神谷 浩史', '花澤 香菜', '梶 裕貴']
actor_names.each do |actor_name|
  CSV.foreach("db/csvs/pixiv_actor_#{actor_name.gsub(" ", "")}.csv") do |row|
    character_name = row[0]
    anime_title = row[1]

    Character.find_or_create_by(name: character_name)
    Anime.find_or_create_by(title: anime_title)
  end
end