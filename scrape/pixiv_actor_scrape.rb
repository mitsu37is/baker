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
url = 'https://dic.pixiv.net/a/%E5%B0%8F%E6%9D%BE%E6%9C%AA%E5%8F%AF%E5%AD%90'

# put actor names into actors array
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
CSV.open('db/pixiv_actor_小松未可子.csv', 'w') do |csv|
  csv_row_array = [character, animation].transpose
  csv_row_array.each do |row|
    csv << row
  end
end

puts 'All tasks successfully done.'