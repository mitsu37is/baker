# frozen_string_literal: true

require 'mechanize'
require 'logger'
require 'csv'

# set up mechanize agent
agent = Mechanize.new
agent.robots = 'enabled'
agent.user_agent_alias = 'Mac Safari'
agent.log = Logger.new('scrape/pixiv_actor_log.txt')

# prepare url
# 花澤香菜さんのPixivページ
url = 'https://dic.pixiv.net/a/%E8%8A%B1%E6%BE%A4%E9%A6%99%E8%8F%9C'

# put actor names into actors array
html = agent.get(url)
chara_animes = html.search('//*[@id="article-body"]/table[2]/tr/td').map(&:inner_text)
chara_animes.delete('')
character = []
animation = []
chara_animes.each do |chara_anime|
  m = chara_anime.match(/@|＠/)
  character << m.pre_match
  animation << m.post_match
end

# save as csv
CSV.open('db/csvs/pixiv_actor_花澤香菜.csv', 'w') do |csv|
  csv_row_array = [character, animation].transpose
  csv_row_array.each do |row|
    csv << row
  end
end

puts 'All tasks successfully done.'