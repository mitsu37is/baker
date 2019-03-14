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
# だれかさんのPixivページ
url = 'https://dic.pixiv.net/a/%E8%8A%B1%E6%BE%A4%E9%A6%99%E8%8F%9C'

# analyze fetched html page
html = agent.get(url)
chara_animes = html.search('//*[@id="article-body"]/table[2]/tr/td').map(&:inner_text)
chara_animes.delete('')
# print(chara_animes)
character = []
animation = []
chara_animes.each do |chara_anime|
  m = chara_anime.strip.match(/@|＠/)
  begin
    character << m.pre_match
    animation << m.post_match
  rescue NoMethodError
    next
  end
end

# save as csv
CSV.open('db/pixiv_actor_花澤香菜.csv', 'w') do |csv|
  csv_row_array = [character, animation].transpose
  p csv_row_array
  csv_row_array.each do |row|
    csv << row
  end
end

puts 'All tasks successfully done.'