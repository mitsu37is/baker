# frozen_string_literal: true

require 'mechanize'
require 'logger'
require 'csv'

# set up mechanize agent
agent = Mechanize.new
agent.robots = 'enabled'
agent.user_agent_alias = 'Mac Safari'
agent.log = Logger.new('scrape/pixiv_anime_log.txt')

# prepare url
# アニメ登場人物一覧のPixivページ
url = 'https://dic.pixiv.net/a/%E5%90%8D%E6%8E%A2%E5%81%B5%E3%82%B3%E3%83%8A%E3%83%B3%E3%81%AE%E7%99%BB%E5%A0%B4%E4%BA%BA%E7%89%A9%E4%B8%80%E8%A6%A7'

# put actor names into actors array
html = agent.get(url)
chara_actors = html.search('//*[@id="article-body"]/ul/li').map(&:inner_text)
# actor = html.search('//*[@id="article-body"]/ul/li/a[2]').map(&:inner_text)

chara_actors.delete('')
character = []
actor = []
chara_actors.each do |chara_actor|
  m = chara_actor.strip.match(/CV：/)
  begin
    character << m.pre_match
    actor << m.post_match
  rescue NoMethodError
    next
  end
end

# save as csv
CSV.open('db/pixiv_anime_名探偵コナン.csv', 'w') do |csv|
  csv_row_array = [character, actor].transpose
  csv_row_array.each do |row|
    csv << row
  end
end

puts 'All tasks successfully done.'