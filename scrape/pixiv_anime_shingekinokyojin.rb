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
# 進撃の巨人登場人物一覧のPixivページ
url = 'https://dic.pixiv.net/a/%E9%80%B2%E6%92%83%E3%81%AE%E5%B7%A8%E4%BA%BA%E3%81%AE%E7%99%BB%E5%A0%B4%E4%BA%BA%E7%89%A9%E4%B8%80%E8%A6%A7'

# put actor names into actors array
html = agent.get(url)
character = html.search('//*[@id="article-body"]/ul/li/a[1]').map(&:inner_text)
actor = html.search('//*[@id="article-body"]/ul/li/a[2]').map(&:inner_text)

# 声優情報がないキャラがいるので消す
character.pop(20)
actor.pop

# save as csv
CSV.open('db/csvs/pixiv_anime_進撃の巨人.csv', 'w') do |csv|
  csv_row_array = [character, actor].transpose
  csv_row_array.each do |row|
    csv << row
  end
end

puts 'All tasks successfully done.'